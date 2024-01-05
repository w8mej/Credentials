################################################################
######                                             #############
######             John Menerick's Salt user       #############
######                                             #############
################################################################

security:
  group.present:
    - gid: 9000
    - system: false

#################################################################
###########             Add Users for ops

thesorrow:
  user.present:
    - fullname: John Menerick
    - shell: /bin/bash
    - home: /home/thesorrow
    - homephone: "16015338425"
    - workphone: "16015338425"
    - password: "$1$PJ4PQ/fc$3RmEEGhCH9JI2LR4mWPgU/"
    - enforce_password: True
    - empty_password: False
    - hash_password: False
    - allow_uid_change: True
    - allow_gid_change: True
    - remove_groups: True
    - createhome: True
    - system: False
    - roomnumber: "1337"
    - mindays: 1
    - maxdays: 4
    - inactdays: 1
    - warndays: 2
    - expire: 1735632000
    - other:
      - ssh_key_type: ed25519
      - ssh_keys:
        - pubkey: "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE5qJxxYl4O5ngWxnfCMupulq7vkvdVecgFnxTiqaU4W cardno:15_260_751"
    - uid: 9009
    - gid: 9000
    - groups:
      - security
      - human
    - optional_groups:
      - adm
      - docker
      - users
      - netdev
      - plugdev
      - audit
      - emcomm
      - human
      - defender
      - incidentresponse
      - purpleteam
      - redteam
      - blueteam
      - vulnmgt
      - disk
      - lp
      - mail
      - news
      - man
      - kmem
      - audio
      - dip
      - operator
      - list
      - irc
      - src
      - utmp
      - sasl
      - staff
      - systemd-journal
      - systemd-network
      - systemd-resolve
      - systemd-timesync
      - systemd-bus-proxy
      - kvm
      - crontab
      - syslog
      - fuse
      - bluetooth
      - ssl-cert
      - lpadmin
      - debian-tor
      - mlocate
      - ssh
      - utempter
      - rtkit
      - saned
      - nm-openvpn
      - nm-openconnect
      - systemd-coredump
      - whoopsie
      - landscape
      - epmd
      - sslh
      - _apt
      - dnsmasq
      - stunnel4
      - i2c
      - miredo
      - nopasswordlogin
      - systemd-journal-remote
      - smmsp
      - kvm
      - qemu
      - libvirt
      - libvirt-qemu
      - libvirt-dnsmasq
      - lxd
      - sddm
      - openbox
      - firewall
      - tap
      - ebf
      - nightmarefilesystem
    - createhome: True
    - require:
      - group: thesorrow
  
