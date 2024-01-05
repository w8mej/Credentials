user { "thesorrow":
        ensure     => present,
	uid        => "9009",
        gid        => "9009",
        home       => "/home/thesorrow"
	groups     => [ "adm", "docker", "users", "netdev", "plugdev", "audit", "emcomm", "human", "defender", "incidentresponse", "purpleteam", "redteam", "blueteam", "vulnmgt", "disk", "lp", "mail", "news", "man", "kmem", "audio", "dip", "operator", "list", "irc", "src", "utmp", "sasl", "staff", "systemd-journal", "systemd-network", "systemd-resolve", "systemd-timesync", "systemd-bus-proxy", "kvm", "crontab", "syslog", "fuse", "bluetooth", "ssl-cert", "lpadmin", "debian-tor", "mlocate", "ssh", "utempter", "rtkit", "saned", "nm-openvpn", "nm-openconnect", "systemd-coredump", "whoopsie", "landscape", "epmd", "sslh", "_apt", "dnsmasq", "stunnel4", "i2c", "miredo", "nopasswordlogin", "systemd-journal-remote", "smmsp", "kvm", "qemu", "libvirt", "libvirt-qemu", "libvirt-dnsmasq", "lxd", "sddm", "openbox", "firewall", "tap", "ebf", "nightmarefilesystem"],
        membership => minimum,
        shell      => "/bin/zsh",
	comment    => "16015338425 haxx.ninja https://keyoxide.org/sephiroth@haxx.ninja",
        escalation => : "6015338425@voice.google.com",
        email      => "sephiroth@haxx.ninja",
        password   => Sensitive("$1$rrKUGBcW$Yj7vUmlu2AU2jvyF4As.q."),
        ssh_key    => "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE5qJxxYl4O5ngWxnfCMupulq7vkvdVecgFnxTiqaU4W cardno:15_260_751",
	tag        => ['purple', 'secuity', 'human'],
	name       => "John Menerick",
	allowdupe  => "false",
        expiry     => "2024-12-31",
        forcelocal => "yes",
        iterations => "460000",
        loginclass => "human",
        managehome => "yes",
        membership => "inclusive",
        salt       => "salty",
        password_max_age => "4",
        password_min_age => "1",
        password_warn_days => "2",
        provider   => "directoryservice",
        purge_ssh_keys => "true",
        system     => "no"
   
}

