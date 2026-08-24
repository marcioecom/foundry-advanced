# Advanced Foundry

Repositório de estudo do curso [Advanced Foundry](https://updraft.cyfrin.io/courses/advanced-foundry), da [Cyfrin Updraft](https://updraft.cyfrin.io/). Cada módulo do curso é um projeto Foundry independente, com contratos, testes, scripts e dependências próprios.

O objetivo é registrar implementações práticas dos protocolos e técnicas abordados no curso, sem tratar este repositório como código pronto para produção.

## Estrutura

```text
.
├── erc-20/                 # Implementação e testes de tokens ERC-20
├── nft/                    # Implementação e testes de uma coleção NFT
├── defi-protocol/          # Futuro: protocolo DeFi e stablecoin
├── cross-chain-rebase/     # Futuro: token rebase cross-chain
├── airdrop-signatures/     # Futuro: airdrop, assinaturas e Merkle proofs
├── upgradeable-contracts/  # Futuro: contratos atualizáveis
├── account-abstraction/    # Futuro: account abstraction
├── dao/                    # Futuro: DAO e governança
└── security/               # Futuro: práticas e exercícios de segurança
```

## Módulos do curso

| Módulo | Diretório | Foco |
| --- | --- | --- |
| ERC-20 Cryptocurrency | [`erc-20/`](./erc-20) | Tokens ERC-20, implementação manual e OpenZeppelin. |
| NFT Collection | [`nft/`](./nft) | Coleções NFT e padrões ERC-721. |
| DeFi Protocol | `defi-protocol/` | Protocolo DeFi, oráculos e stablecoin. |
| Cross Chain Rebase Token | `cross-chain-rebase/` | Token com rebase e comunicação cross-chain. |
| Airdrop and Signatures | `airdrop-signatures/` | Airdrops, assinaturas e verificação de elegibilidade. |
| Upgradeable Smart Contracts | `upgradeable-contracts/` | Proxies e padrões de upgrade. |
| Account Abstraction | `account-abstraction/` | Fluxos e contratos de account abstraction. |
| DAOs | `dao/` | Governança on-chain e DAO. |
| Security | `security/` | Segurança, fuzzing e verificação manual. |

Os diretórios marcados como futuros serão adicionados conforme o avanço no curso.

## Pré-requisitos

- [Foundry](https://getfoundry.sh/)
- `make`
- Git, para instalar as dependências configuradas por cada módulo

Após instalar o Foundry, atualize as ferramentas:

```bash
foundryup
```

## Como executar um módulo

Cada pasta possui seu próprio `foundry.toml`, dependências e comandos. Entre no módulo desejado antes de executar comandos Foundry:

```bash
cd erc-20
forge build
forge test
```

Quando o módulo disponibilizar um `Makefile`, prefira os atalhos documentados nele:

```bash
cd erc-20
make install
make build
forge test
```

Consulte o `README.md` interno de cada módulo para instruções de deploy, variáveis de ambiente e comandos específicos.

## Convenções

Cada novo módulo deve manter esta estrutura mínima:

```text
nome-do-modulo/
├── src/          # Contratos Solidity
├── script/       # Scripts de deploy e interação
├── test/         # Testes unitários, fuzz e invariantes
├── lib/          # Dependências instaladas pelo Foundry
├── foundry.toml  # Configuração do módulo
└── README.md     # Objetivo, arquitetura e instruções locais
```

Comandos e configurações que dependem de RPC URLs, chaves privadas ou contas devem usar variáveis de ambiente locais e nunca ser versionados.

## Referência

- [Advanced Foundry - Cyfrin Updraft](https://updraft.cyfrin.io/courses/advanced-foundry)
- [Documentação do Foundry](https://book.getfoundry.sh/)
