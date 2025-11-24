import csv
import sys

# --- CORREÇÃO PARA O ERRO DE EMOJI NO WINDOWS ---
# Isso força o terminal a aceitar caracteres especiais e acentos
try:
    sys.stdout.reconfigure(encoding='utf-8')
except AttributeError:
    pass
# ------------------------------------------------

# IMPORTANTE: O nome do arquivo tem que ser IGUAL ao que está na pasta
# Vi no seu erro que o nome do arquivo lido foi "Fake DataBase- studies - Pgina1.csv"
# Se você renomeou, mude aqui embaixo também:
arquivo = 'ALunos.csv' 

print(f"--- INICIANDO ANALISE DE DADOS: {arquivo} ---\n")

total_frequencia = 0
contador_alunos_ativos = 0
alunos_risco = []
faturamento_mensal = 0

try:
    with open(arquivo, mode='r', encoding='utf-8') as f:
        leitor = csv.DictReader(f)
        
        for linha in leitor:
            # 1. Limpeza de Dados
            try:
                # Remove % e troca vírgula por ponto
                freq_texto = linha['frequencia_media'].replace('%', '').replace(',', '.')
                valor_texto = linha['mensalidade'].replace('R$', '').replace(',', '.')
                
                freq_numero = float(freq_texto)
                valor_mensalidade = float(valor_texto)
            except (ValueError, KeyError):
                continue # Pula linha se der erro

            # 2. Lógica de Negócio
            if linha['status'] == 'Ativo':
                total_frequencia += freq_numero
                contador_alunos_ativos += 1
                faturamento_mensal += valor_mensalidade
            
            # Regra de Risco: Cancelado OU Frequência < 60%
            if linha['status'] == 'Cancelado' or freq_numero < 60:
                alunos_risco.append({
                    'nome': linha['nome'],
                    'status': linha['status'],
                    'freq': freq_numero
                })

    # 3. Exibindo os Resultados
    if contador_alunos_ativos > 0:
        media = total_frequencia / contador_alunos_ativos
        print(f"METRICAS GERAIS (Akin Academy):") # Tirei o emoji pra garantir
        print(f"   - Total de Alunos Ativos: {contador_alunos_ativos}")
        print(f"   - Faturamento Mensal Estimado: R$ {faturamento_mensal:.2f}")
        print(f"   - Media de Frequencia Global: {media:.1f}%")
    
    print(f"\nALERTA DE CHURN (Alunos em Risco ou Cancelados):") # Tirei o emoji pra garantir
    for aluno in alunos_risco:
        print(f"   - {aluno['nome']} ({aluno['status']}) -> Freq: {aluno['freq']}%")

    print("\n--- FIM DA ANALISE ---")

except FileNotFoundError:
    print(f"ERRO: O arquivo '{arquivo}' nao foi encontrado. Verifique se o nome esta certo!")