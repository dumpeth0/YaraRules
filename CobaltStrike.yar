rule CobaltStrike_Beacon {
          meta:
            description = "detect CobaltStrike Beacon in memory"
            author = "JPCERT/CC Incident Response Group"
            rule_usage = "memory scan"
            reference = "https://blogs.jpcert.or.jp/en/2018/08/volatility-plugin-for-detecting-cobalt-strike-beacon.html"
            hash1 = "154db8746a9d0244146648006cc94f120390587e02677b97f044c25870d512c3"
            hash2 = "f9b93c92ed50743cd004532ab379e3135197b6fb5341322975f4d7a98a0fcde7"

          strings:
            $v1 = { 73 70 72 6E 67 00 }
            $v2 = { 69 69 69 69 69 69 69 69 }

          condition: all of them
}
rule CobaltStrike_NamedPipe {
    strings:
        $pipe = /\\\\\.\\pipe\\[0-9a-f]{7,10}/ ascii wide fullword
        $guidPipe = /\\\\\.\\pipe\\[0-9a-f]{8}\-/ ascii wide
    condition:
        $pipe and not ($guidPipe)
}