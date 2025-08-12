# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {
# META     "lakehouse": {
# META       "default_lakehouse": "c8b77d0e-7583-42df-abff-8d429d0aee6c",
# META       "default_lakehouse_name": "Lakehouse",
# META       "default_lakehouse_workspace_id": "2655baca-93c7-498c-b7e7-ab280276fbe2",
# META       "known_lakehouses": [
# META         {
# META           "id": "c8b77d0e-7583-42df-abff-8d429d0aee6c"
# META         }
# META       ]
# META     }
# META   }
# META }

# CELL ********************

df = spark.sql("SELECT * FROM Lakehouse.production_data_100k")
display(df.head(5))

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

print(type(df))
df.count()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df_p = df.to_pandas_on_spark()
df_p.shape

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

grouped = df_p.groupby('steps.measurements.name')['steps.measurements.value'].mean()
s = grouped.to_pandas()


import matplotlib.pyplot as plt
# Plot the result
s.plot(kind='bar')
plt.title('Average Value per Category')
plt.ylabel('Average Value')
plt.show()

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df_p.columns

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

import pyspark.pandas as ps

# Convert PySpark DataFrame to Koalas
df_k = ps.DataFrame(df)


df_k = df_k.sort_values(by='steps.ts', ascending=True)

#df_k = df_k.assign(
#    running_mean=(
#        df_k[['steps.measurements.name', 'steps.measurements.value']]
#        .groupby('steps.measurements.name')
#        .rolling(window=10, min_periods=1)
#        .mean()['steps.measurements.value']
#        .reset_index(level=0, drop=True)
#    )
#)



# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

#safe_column_mapping = {col: col.replace('.', '_') for col in df_k.columns}
#df_k.columns = list(safe_column_mapping.values())


#df_k.to_table("production_data_100k_running_mean", mode="overwrite")

#spark_df = df_k.to_spark()
#spark_df.write.format("delta").mode("overwrite").saveAsTable("production_data_100k_with_running_mean")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

ps.set_option("compute.ops_on_diff_frames", True)


idx = df_k['steps.step_index'] == 1
s1 = df_k[idx]['steps.measurements.value'].rolling(window=10, min_periods=1).mean()

idx = df_k['steps.step_index'] == 2
s2 = df_k[idx]['steps.measurements.value'].rolling(window=10, min_periods=1).mean()

idx = df_k['steps.step_index'] == 3
s3 = df_k[idx]['steps.measurements.value'].rolling(window=10, min_periods=1).mean()

idx = df_k['steps.step_index'] == 4
s4 = df_k[idx]['steps.measurements.value'].rolling(window=10, min_periods=1).mean()

foo = ps.concat([s1, s2, s3, s4], axis=0)

df_k['rolling_mean'] = 1

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df_k.head(5)

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }

# CELL ********************

df_k.to_table("production_data_100k_running_mean", mode="overwrite")

# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
