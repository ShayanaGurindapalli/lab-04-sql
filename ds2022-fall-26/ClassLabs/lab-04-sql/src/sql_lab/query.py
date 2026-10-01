import logging
import mysql.connector

# Configure logging format
logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s")

def get_db_connection():
    """Returns a direct active database connection using absolute credentials."""
    db_host = 'ds2022.cgls84scuy1e.us-east-1.rds.amazonaws.com'
    db_user = 'uyc4cf'
    db_pass = 'uyc4cf'
    db_name = 'uyc4cf_mock'
        
    return mysql.connector.connect(
        host=db_host,
        user=db_user,
        password=db_pass,
        database=db_name,
        port=3306
    )

def get_data_by_group(value: str) -> list:
    """Runs a parameterized query to find all rows matching a specific group value."""
    logging.info(f"Running parameterized lookup query matching `group` = '{value}'...")
    connection = None
    rows = []
    try:
        connection = get_db_connection()
        cursor = connection.cursor(dictionary=True)
        query = "SELECT * FROM mock WHERE `group` = %s"
        cursor.execute(query, (value,))
        rows = cursor.fetchall()
        logging.info(f"Lookup query success. Found {len(rows)} matching group records.")
    except Exception as e:
        logging.error(f"Error querying data by group: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
    return rows

def plot_counts(groupby: str) -> None:
    """Runs a SELECT COUNT(*) GROUP BY query on a specified column name."""
    logging.info(f"Running statistical collection query grouped by column `{groupby}`...")
    connection = None
    try:
        connection = get_db_connection()
        cursor = connection.cursor()
        query = f"SELECT `{groupby}`, COUNT(*) FROM mock GROUP BY `{groupby}`"
        cursor.execute(query)
        results = cursor.fetchall()
        
        print(f"\n--- Distribution Count Summaries per `{groupby}` ---")
        for key, count in results:
            print(f" Category: {str(key):<25} | Records Found: {count}")
        print("-" * 50)
        logging.info("Aggregation query executed successfully.")
    except Exception as e:
        logging.error(f"Failed to generate group summary matrix distribution: {e}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

def main():
    """Main execution block running sample target query demonstrations."""
    logging.info("Starting query evaluation sequence demonstration...")
    
    group_records = get_data_by_group("Team A")
    print(f"\n--- Printing First 3 Sample Matches for 'Team A' ---")
    for row in group_records[:3]:
        print(f"{row['first_name']} {row['last_name']} ({row['email']})")
        
    plot_counts("group")
    plot_counts("gender")

if __name__ == "__main__":
    main()

