# Kronos ERC-20

Módulo de estudo **Develop an ERC20 Cryptocurrency** do curso [Advanced Foundry](https://updraft.cyfrin.io/courses/advanced-foundry), da Cyfrin Updraft.

O projeto compara duas abordagens:

- `Kronos`: token ERC-20 baseado nas implementações auditadas do OpenZeppelin.
- `ManualToken`: exercício didático que explicita a estrutura mínima de um token, sem implementar integralmente o padrão ERC-20.

> Este é um projeto educacional. Não o utilize em produção sem revisão de segurança, testes completos e definição de requisitos de emissão, governança e operação.

## Contratos

### `Kronos`

Arquivo: [`src/Kronos.sol`](./src/Kronos.sol)

`Kronos` herda `ERC20`, `ERC20Burnable` e `Ownable` do OpenZeppelin.

| Propriedade | Valor |
| --- | --- |
| Nome | `Kronos Capital Share` |
| Símbolo | `KRO` |
| Decimais | 18, fornecidas por `ERC20` |
| Emissão inicial | Nenhuma |
| Emissão posterior | Apenas o `owner`, por `mint` |
| Queima | Qualquer titular pode queimar os próprios tokens, por `burn` |

```solidity
function mint(address to, uint256 amount) public onlyOwner
```

O endereço `initialOwner` é fornecido no deploy. O script de deploy usa o remetente da transação como proprietário. Assim, a conta usada para fazer o deploy também deve assinar as operações de mint.

### `ManualToken`

Arquivo: [`src/ManualToken.sol`](./src/ManualToken.sol)

Contrato usado para estudar balances, eventos e a lógica de `transfer`. Ele declara nome `Kronos Capital Share`, símbolo `KRC`, 18 decimais e `totalSupply` de `100 ether`.

O contrato **não é uma implementação ERC-20 completa**:

- o supply declarado não é atribuído a nenhum endereço no deploy;
- `transferFrom`, `approve` e `allowance` estão declaradas, mas não possuem implementação;
- não há armazenamento de allowances.

Portanto, use `ManualToken` somente como referência de estudo. Para interações ERC-20 compatíveis, use `Kronos`.

## Estrutura

```text
.
├── src/
│   ├── Kronos.sol                 # ERC-20 com OpenZeppelin, mint e burn
│   └── ManualToken.sol            # Exercício de implementação manual
├── script/
│   ├── DeployKronosToken.s.sol    # Deploy de Kronos
│   └── Interactions.s.sol          # Mint para destinatários pré-configurados
├── test/                          # Reservado para testes Solidity
├── lib/
│   ├── forge-std/
│   ├── foundry-devops/
│   └── openzeppelin-contracts/
├── foundry.toml
├── Makefile
└── .github/workflows/test.yml     # Formatação, build e forge test no CI
```

## Pré-requisitos

- [Foundry](https://getfoundry.sh/)
- Git e submódulos do repositório inicializados
- `make` para os atalhos do projeto

Atualize as ferramentas do Foundry antes de iniciar:

```bash
foundryup
```

## Instalação e validação

Na pasta deste módulo:

```bash
make install
make build
forge test
```

Também é possível executar verificações manuais equivalentes:

```bash
forge fmt --check
forge build --sizes
forge test -vvv
```

O workflow de CI executa essas três verificações a cada `push`, `pull request` ou execução manual. No estado atual, `test/` não contém arquivos de teste Solidity. Logo, `forge test` confirma a execução do comando, mas não cobre comportamento dos contratos.

## Deploy local

Inicie uma rede Anvil em outro terminal:

```bash
make anvil
```

Em seguida, faça o deploy usando a conta local padrão configurada no `Makefile`:

```bash
make deploy
```

O script [`DeployKronosToken.s.sol`](./script/DeployKronosToken.s.sol) cria `Kronos` e atribui a propriedade à conta transmissora.

## Mint local

Após um deploy local, execute:

```bash
make mintTokens
```

O script procura o deploy mais recente de `Kronos` para a rede atual com `foundry-devops` e tenta emitir `10` tokens para cada endereço configurado em [`script/Interactions.s.sol`](./script/Interactions.s.sol). O remetente deve ser o `owner` do token para que as chamadas a `mint` não revertam.

## Deploy na Sepolia

Configure as variáveis de ambiente localmente. O arquivo `.env` é ignorado pelo Git:

```bash
export SEPOLIA_RPC_URL="https://..."
export ACCOUNT="nome-ou-alias-da-conta"
export ADDRESS="0x..."
export ETHERSCAN_API_KEY="..." # Opcional: habilita verificação do contrato
```

Depois execute:

```bash
make deploy-sepolia
```

Nunca versione URLs privadas de RPC, chaves privadas, seed phrases ou chaves de API.

## Dependências

- [Foundry](https://book.getfoundry.sh/)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [forge-std](https://github.com/foundry-rs/forge-std)
- [foundry-devops](https://github.com/Cyfrin/foundry-devops)

## Referência

- [Advanced Foundry - Cyfrin Updraft](https://updraft.cyfrin.io/courses/advanced-foundry)
