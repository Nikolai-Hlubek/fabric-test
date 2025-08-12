# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "28ea0780-322a-4d49-8e6b-2c2039a676df",
# META       "default_lakehouse_name": "Werkzeugbau",
# META       "default_lakehouse_workspace_id": "e58a04c9-b9e4-44cb-b315-07569b01fee4",
# META       "known_lakehouses": [
# META         {
# META           "id": "28ea0780-322a-4d49-8e6b-2c2039a676df"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

# Welcome to your new notebook
# Type here in the cell editor to add code!


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df = spark.sql("SELECT * FROM Werkzeugbau.dimension_customer LIMIT 1000")
display(df)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
