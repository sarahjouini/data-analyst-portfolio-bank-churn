import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv("data/processed/bank_churners_clean.csv")

print(df.shape)
print(df['Attrition_Flag'].value_counts(normalize=True))
print(df.groupby('Attrition_Flag')['Total_Trans_Ct'].mean())
df.boxplot(column='Total_Trans_Ct', by='Attrition_Flag')
plt.title('Numero di transazioni per stato del cliente')
plt.suptitle('')
plt.xlabel('Stato cliente')
plt.ylabel('Totale transazioni')
plt.savefig('reports/transazioni_per_stato.png')
plt.show()
print(df.groupby('Attrition_Flag')['Total_Relationship_Count'].mean())
df.boxplot(column='Total_Relationship_Count', by='Attrition_Flag')
plt.title('Numero di relazioni con la banca per stato del cliente')
plt.suptitle('')
plt.xlabel('Stato cliente')
plt.ylabel('Totale relazioni/prodotti')
plt.savefig('reports/relazioni_per_stato.png')
plt.show()