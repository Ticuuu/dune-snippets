--Addresses are JOIN addresses from here https
    : // changelog.makerdao.com/releases/mainnet/1.2.1/contracts.json
      CREATE TABLE IF NOT EXISTS makermcd.collateral_addresses (
          address bytea, project text, token_address bytea, details text);

BEGIN;
DELETE FROM makermcd.collateral_addresses *;

COPY makermcd.collateral_addresses (address, project, token_address,
                                    details) FROM stdin;
\\x2f0b23f53734252bda2277357e97e1517d6b042a
    MakerDAO	\\xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2 WETH A
\\x08638eF1A205bE6762A8b935F5da9b700Cf7322c
        MakerDAO	\\xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2 WETH B
\\x3d0b1912b66114d4096f48a8cee3a56c231772ca
            MakerDAO	\\x0d8775f648430679a709e98d2b0cb6250d2887ef BAT
\\xA191e578a6736167326d05c119CE0c90849E84B7
                MakerDAO	\\xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48 USDC A
\\x2600004fd1585f7270756DDc88aD9cfA10dD0428
                    MakerDAO	\\xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48 USDC B
\\x4454aF7C8bb9463203b66C816220D41ED7837f44
                        MakerDAO	\\x0000000000085d4780B73119b644AE5ecd22b376 TUSD
\\xc7e8Cd72BDEe38865b4F5615956eF47ce1a7e5D0
                            MakerDAO	\\xe41d2489571d322189246dafa5ebde1f4699f498 ZRX
\\x475F1a89C1ED844A08E8f6C50A00228b5E59E4A9
                                MakerDAO	\\xdd974d5c2e2928dea5f71b9825b8b646686bd200 KNC
\\xA6EA3b9C04b8a38Ff5e224E7c3D6937ca44C0ef9 MakerDAO	\\x0f5d2fb29fb7d3cfee444a200298f468908cc942
                                    Mana
\\x0Ac6A1D74E84C2dF9063bDDc31699FF2a2BB22A2 MakerDAO	\\xdac17f958d2ee523a2206206994597c13d831ec7
                                        USDT
\\x7e62B7E279DFC78DEB656E34D6a435cC08a44666 MakerDAO	\\x8e870d67f660d95d5be530380d0ec0bd388289e1
                                            PAXUSD
\\xBEa7cDfB4b49EC154Ae1c0D731E4DC773A3265aA MakerDAO	\\xc00e94cb662c3520282e6f5717214004a7f26888
                                                COMP
\\x6C186404A7A238D3d6027C0299D1822c1cf5d8f1 MakerDAO	\\xbbbbca6a901c926f240b89eacb641d8aec7aeafd
                                                    LRC
\\xdFccAf8fDbD2F4805C174f856a317765B49E4a50 MakerDAO	\\x514910771af9ca656af840dff83e8264ecf986ca
                                                        LINK
\\xBF72Da2Bd84c5170618Fbe5914B0ECA9638d5eb5 MakerDAO	\\x2260fac5e5542a773aa44fbcfedf7c193bc2c599
                                                            WBTC
\\x4a03Aa7fb3973d8f0221B466EefB53D0aC195f55 MakerDAO	\\xba100000625a3754423978a60c9317c58a424e3d
                                                                BAL
\\x3ff33d9162aD47660083D7DC4bC02Fb231c81677 MakerDAO	\\x0bc529c00C6401aEF6D220BE8C6Ea1667F6Ad93e
                                                                    YFI
\\xe29A14bcDeA40d83675aa43B72dF07f649738C8b MakerDAO	\\x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd
                                                                        GUSD
\\x3BC3A58b4FC1CbE7e98bB4aB7c99535e8bA9b8F1 MakerDAO	\\x1f9840a85d5aF5bf1D1762F925BDADdC4201F984
                                                                            UNI
\\xFD5608515A47C37afbA68960c1916b79af9491D0 MakerDAO	\\xEB4C2781e4ebA804CE9a9803C67d0893436bB27D
                                                                                RENBTC
\.

    COMMIT;
