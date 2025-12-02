from storage import Storage
import traceback

def print_table_info(cursor, table_name):
    """Print information about a database table."""
    try:
        # Get row count
        cursor.execute(f"SELECT COUNT(*) as count FROM `{table_name}`")
        count = cursor.fetchone()['count']
        print(f"\n📊 Table: {table_name}")
        print(f"   Rows: {count:,}")
        
        # Get column information
        cursor.execute(f"DESCRIBE `{table_name}`")
        columns = cursor.fetchall()
        print("\n   Columns:")
        for col in columns:
            col_type = col['Type'].decode() if isinstance(col['Type'], bytes) else col['Type']
            print(f"   - {col['Field']}: {col_type} {'(PK)' if col['Key'] == 'PRI' else ''}")
        
        # Get sample data
        if count > 0:
            cursor.execute(f"SELECT * FROM `{table_name}` LIMIT 2")
            sample_data = cursor.fetchall()
            print("\n   Sample data:")
            for i, row in enumerate(sample_data, 1):
                print(f"   Row {i}:")
                for key, value in row.items():
                    if value is not None and len(str(value)) > 50:
                        value = str(value)[:50] + "..."
                    print(f"     {key}: {value}")
        
        return True
    except Exception as e:
        print(f"   Error: {e}")
        return False

def test_database_connection():
    """Test database connection and gather information."""
    print("🔍 Testing Database Connection...")
    storage = Storage()
    
    # Test connection
    if not storage.connect():
        print("❌ Failed to connect to the database")
        return False
    
    print("✅ Successfully connected to the database")
    
    try:
        # Get database name
        storage.cursor.execute("SELECT DATABASE() as db")
        db_name = storage.cursor.fetchone()['db']
        print(f"\n📂 Database: {db_name}")
        
        # Get all tables
        storage.cursor.execute("SHOW TABLES")
        tables = [list(table.values())[0] for table in storage.cursor.fetchall()]
        print(f"\n📋 Found {len(tables)} tables: {', '.join(tables)}")
        
        # Check each table
        for table in tables:
            print_table_info(storage.cursor, table)
        
        # Check for any views
        storage.cursor.execute("""
            SELECT table_name 
            FROM information_schema.views 
            WHERE table_schema = DATABASE()
        """)
        views = [row['table_name'] for row in storage.cursor.fetchall()]
        if views:
            print(f"\n👁️  Found {len(views)} view(s): {', '.join(views)}")
            for view in views:
                print_table_info(storage.cursor, view)
        
        return True
        
    except Exception as e:
        print(f"\n❌ Error: {e}")
        print("\nStack trace:")
        traceback.print_exc()
        return False
    finally:
        storage.close()
        print("\n🔌 Database connection closed")

if __name__ == "__main__":
    test_database_connection()
