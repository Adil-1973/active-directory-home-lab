# Active Directory Home Lab

A virtualised Windows Server 2022 Active Directory environment built to practise
the tasks of an IT support / junior sysadmin role.

## Objective
Build a domain (`corp.local`) with departmental OUs, security groups, file shares
with role-based permissions, and Group Policy, then troubleshoot real issues.

## Environment
| Item | Details |
|---|---|
| Hypervisor | Oracle VirtualBox |
| Domain controller | Windows Server 2022 (DC01), 4 GB RAM, 2 vCPU |
| Client | Windows 11 Pro (PC01), 4 GB RAM, 2 vCPU |
| Network | Internal network `labnet`, 192.168.10.0/24 |
| Domain | corp.local |

## Network diagram
![Network diagram](diagrams/network-diagram.png)

## What I built
- [x] Active Directory Domain Services and DNS on DC01
- [x] 6 OUs, 4 security groups, X users (HR, Sales, IT, Finance)
- [x] Windows 11 client joined to the domain
- [x] Departmental file shares with NTFS + share permissions
- [x] Group Policy: desktop wallpaper and personalization restrictions

## Implementation
1. [Environment setup](docs/01-environment-setup.md)
2. [Domain controller](docs/02-domain-controller.md)
3. [Users, OUs and groups](docs/03-users-ous-groups.md)
4. [Joining the client](docs/04-join-client-to-domain.md)
5. [File shares and permissions](docs/05-file-shares-permissions.md)
6. [Group Policy](docs/06-group-policy-wallpaper.md)

## Access matrix
| User | HR share | Finance share | Sales share |
|---|---|---|---|
| jsmith (HR-Staff) | Allowed | Denied | Denied |
| dlee (Finance-Staff) | Denied | Allowed | Denied |

## Issues encountered and fixes
See [troubleshooting.md](docs/troubleshooting.md). Highlights:
- Client could not reach the DC: VMs were on different internal network names
- HR user could open the Finance share: Everyone left on NTFS permissions
- User in HR OU had no HR access: OU membership is not group membership
- Deleted user could still log in: cached domain credentials

## Skills demonstrated
Active Directory, DNS, Group Policy, NTFS/share permissions, PowerShell,
VirtualBox, troubleshooting, documentation.

## What I learned
(Write 3 to 4 sentences in your own words.)# active-directory-home-lab
Virtualised Active Directory lab with Windows Server 2022: domain, OUs, groups, file shares and Group Policy.
