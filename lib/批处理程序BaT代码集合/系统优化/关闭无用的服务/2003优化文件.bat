rem WINDOWS 2003服务优化批处理 
@pause 

@rem  Application Experience Lookup Service
@rem  在应用程序启动时为应用程序处理应用程序兼容性查找请求。
sc config   AeLookupSvc start= AUTO

@rem  Alerter 
@rem 微软： 通知选取的使用者及计算机系统管理警示。如果停止这个服务，使用系统管理@rem 警示的程序将不会收到通知。
@rem 补充： 一般家用计算机根本不需要传送或接收计算机系统管理来的警示(Administrative Alerts)，除非你的计算机用在局域网络上 
@rem 依存： Workstation 
@rem 建议： 已停用 
sc config   Alerter start= DISABLED 

@rem  Application Layer Gateway Service 
@rem 微软： 提供因特网联机共享和因特网联机防火墙的第三方通讯协议插件的支持 
@rem 补充： 如果你不使用因特网联机共享 (ICS) 提供多台计算机的因特网存取和因特网联机防火墙 (ICF) 软件你可以关掉 
@rem 依存： Internt Connection Firewall (ICF) / Internet Connection Sharing (ICS) 
@rem 建议： 已停用 
sc config   ALG start= DISABLED 

@rem Application Management (应用程序管理) 
@rem 微软： 提供指派、发行、以及移除的软件安装服务。 
@rem 补充： 如上说的软件安装变更的服务 
@rem 建议： 手动 
sc config   AppMgmt start= DEMAND 

@rem Windows Audio 
@rem 微软： 管理用于 Windows 为主程序的音讯装置。如果这个服务被停止，音讯装置和效果将无法正常?#092;作。如果这个服务被停用，任@rem 何明确依存于它的服务将无法启动。 
@rem 补充： 如果你没有声卡可以关了他 
@rem 依存： Plug and Play、remote Procedure Call (RPC) 
@rem 建议： 自动 
sc config   AudioSrv start= AUTO 

@rem Background Intelligent Transfer Service 
@rem 微软： 使用闲置的网络频宽来传输数据。 
@rem 补充： 经由 Via HTTP1.1 在背景传输资料的?#124;西，例如 Windows Update 就是以此为工作之一 
@rem 依存：remote Procedure Call (RPC) 和 Workstation 
@rem 建议： 已停用 
sc config   BITS start= DISABLED

@rem Computer Browser (计算机浏览器) 
@rem 微软： 维护网络上更新的计算机清单，并将这个清单提供给做为浏览器的计算机。如果停止这个服务，这个清单将不会被更新或维护。@rem 如果停用这个服务，所有依存于它的服务将无法启动。 
@rem 补充： 一般家庭用计算机不需要，除非你的计算机应用在区网之上，不过在大型的区网上有必要开这个拖慢速度吗？ 
@rem 依存： Server 和 Workstation 
@rem 建议： 已停用 
sc config   Browser start= DISABLED

@rem Indexing Service (索引服务) 
@rem 微软： 本机和远程计算机的索引内容和档案属性; 透过弹性的查询语言提供快速档案存取。 
@rem 补充： 简单的说可以让你加快搜查速度，不过我想应该很少人和远程计算机作搜寻吧 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   CiSvc start= DISABLED 


@rem  ClipBook (剪贴簿) 
@rem 微软： 启用剪贴簿检视器以储存信息并与远程计算机共享。如果这个服务被停止，剪贴簿检视器将无法与远程计算机共享信息。如果这@rem 个服务被停用，任何明确依存于它的服务将无法启动。 
@rem 补充： 把剪贴簿内的信息和其它台计算机分享，一般家用计算机根本用不到 
@rem 依存： Network DDE 
@rem 建议： 已停用 
sc config   ClipSrv start= DISABLED 

@rem COM+ System Application 
@rem 微软： 管理 COM+ 组件的设定及追踪。如果停止此服务，大部分的 COM+ 组件将无法适当?#092;作。如果此服务被停用，任何明确依存@rem 它的服务将无法启动。 
@rem 补充： 如果 COM+ Event System 是一台车，那么 COM+ System Application 就是司机，如事件检视器内显示的 DCOM 没有启用 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 手动 
sc config   COMSysApp start= DEMAND 

@rem Cryptographic Services 
@rem 微软： 提供三个管理服务: 确认 Windows 档案签章的 [类别目录数据库服务]; 从这个计算机新增及移除受信任根凭证授权凭证的 [受@rem 保护的根目录服务]; 以及协助注册这个计算机以取得凭证的 [金钥服务]。如果这个服务被停止，这些管理服务将无法正确工作。
@rem 补充： 简单的说就是 Windows Hardware Quality Lab (WHQL)微软的一种认证，如果你有使用 Automatic Updates ，那你可能需要这个 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 手动 
sc config   CryptSvc start= DEMAND 


@rem  DCOM Server Process Launcher
@rem 为 DCOM 服务提供启动功能。
sc config   DcomLaunch start= AUTO 

@rem 将分散的文件共享合并成一个逻辑名称空间并在局域网或广域网上管理这些逻辑卷。如果这个服务被停止，用户则无法访问文件共享。
sc config   Dfs start= DEMAND 

@rem DHCP Client (DHCP 客户端) 
@rem 微软： 透过登录及更新 IP 地址和 DNS 名称来管理网络设定。 
@rem 补充： 使用 DSL/Cable 、ICS 和 IPSEC 的人都需要这个来指定动态 IP 
@rem 依存： AFD 网络支持环境、NetBT、SYMTDI、TCP/IP Protocol Driver 和 NetBios over TCP/IP 
@rem 建议： 手动
sc config   Dhcp start= DEMAND 

@rem Logical Disk Manager Administrative Service (逻辑磁盘管理员系统管理服务) 
@rem 微软： 设定硬盘磁盘及磁盘区，服务只执行设定程序然后就停止。 
@rem 补充： 使用 Microsoft Management Console(MMC)主控台的功能时才用到 
@rem 依存： Plug and Play、remote Procedure Call (RPC)、Logical Disk Manager 
@rem 建议： 手动 
sc config   dmadmin start= DEMAND 

@rem Logical Disk Manager (逻辑磁盘管理员) 
@rem 微软： 侦测及监视新硬盘磁盘，以及传送磁盘区信息到逻辑磁盘管理系统管理服务以供设定。如果这个服务被停止，动态磁盘状态和设@rem 定信息可能会过时。如果这个服务被停用，任何明确依存于它的服务将无法启动。 
@rem 补充： 磁盘管理员用来动态管理磁盘，如显示磁盘可用空间等和使用 Microsoft Management Console(MMC)主控台的功能 
@rem 依存： Plug and Play、remote Procedure Call (RPC)、Logical Disk Manager Administrative Service 
@rem 建议： 自动 
sc config   dmserver start= AUTO 

@rem DNS Client (DNS 客户端) 
@rem 微软： 解析并快取这台计算机的网域名称系统 (DNS) 名称。如果停止这个服务，这台计算机将无法解析 DNS 名称并寻找 Active  @rem Directory 网域控制站的位置。如果停用这个服务，所有依存于它的服务将无法启动。 
@rem 补充： 如上所说的，另外 IPSEC 需要用到 
@rem 依存： TCP/IP Protocol Driver 
@rem 建议： 手动 
sc config   Dnscache start= DEMAND 

@rem Error Reporting Service 
@rem 微软： 允许对执行于非标准环境中的服务和应用程序的错误报告。 
@rem 补充： 微软的应用程序错误报告 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   ERSvc start= DISABLED 

@rem Event Log (事件记录文件) 
@rem 微软： 启用 Windows 为主的程序和组件所发出的事件讯息可以在事件检视器中检视。这个服务不能被停止。 
@rem 补充： 允许事件讯息显示在事件检视器之上 
@rem 依存： Windows Management Instrumentation 
@rem 建议： 自动 
sc config   Eventlog start= AUTO 


@rem COM+ Event System (COM+ 事件系统) 
@rem 微软： 支持「系统事件通知服务 (SENS)」，它可让事件自动分散到订阅的 COM 组件。如果服务被停止，SENS 会关闭，并无法提供登入@rem 及注销通知。 
@rem 补充： 有些程序可能用到 COM+ 组件，像 BootVis 的 optimize system 应用，如事件检视器内显示的 DCOM 没有启用 
@rem 依存：remote Procedure Call (RPC) 和 System Event Notification 
@rem 建议： 手动 
sc config   EventSystem start= DEMAND 

@rem Help and Support 
@rem 微软： 让说明及支持中心能够在这台计算机上执行。如果这个服务停止，将无法使用说明及支持中心。
@rem 补充： 如果不使用就关了吧 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   helpsvc start= DISABLED 

@rem Human Interface Device Access 
@rem 微软： 启用对人性化接口装置 (HID) 的通用输入存取，HID 装置启动并维护对这个键盘、远程控制、以及其它多媒体装置上事先定义的@rem 快捷纽的使用。如果这个服务被停止，这个服务控制的快捷纽将不再起作用。
@rem 补充： 如上所提到的 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   HidServ start= DISABLED 

@rem  http sll
@rem 此服务通过安全套接字层(SSL)实现 HTTP 服务的安全超文本传送协议(HTTPS)。如果此服务被禁用，任何依赖它的服务将无法启动。
sc config   HTTPFilter start= DEMAND 

@rem IMAPI CD-Burning COM Service 
@rem 微软： 使用 Image Mastering Applications Programming Interface (IMAPI) 来管理光盘录制。如果这个服务被停止，这个计算机将@rem 无法录制光盘。如果这个服务被停用，任何明确地依赖它的服务将无法启动。 
@rem 补充： XP 整合的 CD-R 和 CD-RW 光驱上拖放的烧录功能，可惜比不上烧录软件，关掉还可以加快 Nero 的开启速度 
@rem 建议： 已停用 
sc config   ImapiService start= DISABLED

@rem Intersite Messaging
@rem 启用在运行 Windows Server 的站点间交换消息。如果此服务被停用，消息将不交换，而且不计算其他服务的站点路由信息。如果此服务@rem 被禁用，任何依赖于它的服务将无法启用。
sc config   IsmServ start= DISABLED 

sc config   kdc start= DISABLED 

@rem Server (服务器) 
@rem 微软： 透过网络为这台计算机提供档案、打印、及命名管道的共享。如果停止这个服务，将无法使用这些功能。如果停用这个服务，所@rem 有依存于它的服务将无法启动。 
@rem 补充： 简单的说就是档案和打印的分享，除非你有和其它计算机分享，不然就关了 
@rem 依存： Computer Browser 
@rem 建议： 已停用 
sc config   lanmanserver start= DISABLED

@rem Workstation (工作站) 
@rem 微软： 建立并维护到远程服务器的客户端网络联机。如果停止这个服务，这些联机将无法使用。如果停用这个服务，所有依存于它的服@rem 务将无法启动。 
@rem 补充： 因特网联机中所必要的一些功能 
@rem 依存： Alerter、Background Intelligent Transfer Service、Computer Browser、Messenger、Net Logon、remote Procedure Call @rem (RPC) Locator 
@rem 建议： 自动
sc config   lanmanworkstation start= AUTO 


sc config   LicenseService start= DISABLED 


@rem TCP/IP NetBIOS Helper (TCP/IP NetBIOS 协助程序) 
@rem 微软： 启用 [NetBIOS over TCP/IP (NetBT)] 服务及 NetBIOS 名称解析的支持。 
@rem 补充： 如果你的网络不使用 NetBios 或是 WINS ，你大可关闭 
@rem 依存： AFD 网络支持环境、NetBt 
@rem 建议： 已停用 
sc config   LmHosts start= DISABLED 

@rem Messenger (信差) 
@rem 微软： 在客户端及服务器之间传输网络传送及 [Alerter] 服务讯息。这个服务与 Windows Messenger 无关。如果停止这个服务，@rem @rem  Alerter 讯息将不会被传输。如果停用这个服务，所有依存于它的服务将无法启动。 
@rem 补充： 允许网络之间互相传送提示讯息的功能，如 net send 功能，如不想被骚扰话可关了 
@rem 依存： NetBIOS Interface、Plug and Play、remote Procedure Call (RPC)、Workstation 
@rem 建议： 已停用 
sc config   Messenger start= DISABLED 


@rem NetMeetingremote Desktop Sharing (NetMeeting 远程桌面共享) 
@rem 微软： 让经过授权的使用者可以使用 NetMeeting 透过公司近端内部网络，由远程访问这部计算机。如果这项服务停止的话，远程桌面@rem 共享功能将无法使用。如果服务停用的话，任何依赖它的服务将无法启动。 
@rem 补充： 如上说的，让使用者可以将计算机的控制权分享予网络上或因特网上的其它使用者，如果你重视安全性不想多开后门，就关了吧 
@rem 建议： 已停用 
sc config   mnmsrvc start= DISABLED 

@rem Distributed Transaction Coordinator (分布式交易协调器) 
@rem 微软： 协调跨越多个资源管理员的交易，比如数据库、讯息队列及档案系统。如果此服务被停止，这些交易将不会发生。如果服务被停@rem 用 ，任何明显依存它的服务将无法启动。 
@rem 补充： 如上所说的，一般家庭用计算机用不太到，除非你启用的 Message Queuing 
@rem 依存：remote Procedure Call (RPC) 和 Security Accounts Manager 
@rem 建议： 已停用 
sc config   MSDTC start= DISABLED 

@rem Windows Installer (Windows 安装程序) 
@rem 微软： 根据包含在 .MSI 档案内的指示来安装，修复以及移除软件。 
@rem 补充： 是一个系统服务，协助使用者正确地安装、设定、追踪、升级和移除软件程序，可管理应用程序建立和安装的标准格式，并且追@rem 踪例如档案群组、登录项目及快捷方式等组件 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 手动 
sc config   MSIServer start= DEMAND 

@rem Network DDE (网络 DDE) 
@rem 微软： 为动态数据交换 (DDE) 对在相同或不同计算机上执行的程序提供网络传输和安全性。如果这个服务被停止，DDE 传输和安全性将@rem 无法使用。如果这个服务被停用，任何明确依存于它的服务将无法启动。 
@rem 补充： 一般人好像用不到 
@rem 依存： Network DDE DSDM、ClipBook 
@rem 建议： 已停用
sc config   NetDDE start= DISABLED 

@rem Network DDE DSDM (网络 DDE DSDM) 
@rem 微软： 讯息动态数据交换 (DDE) 网络共享。如果这个服务被停止，DDE 网络共享将无法使用。
@rem 补充： 一般人好像用不到 
@rem 依存： Network DDE 
@rem 建议： 已停用
sc config   NetDDEdsdm start= DISABLED 

@rem Net Logon 
@rem 微软： 支持网域上计算机的账户登入事件的 pass-through 验证。 
@rem 补充： 一般家用计算机不太可能去用到登入网域审查这个服务 
@rem 依存： Workstation 
@rem 建议： 已停用 
sc config   Netlogon start= DISABLED 

@rem Network Connections (网络联机) 
@rem 微软： 管理在网络和拨号联机数据夹中的对象，您可以在此数据夹中检视局域网络和远程联机。 
@rem 补充： 控制你的网络联机 
@rem 依存：remote Procedure Call (RPC)、Internet Connection Firewall (ICF) / Internet Connection Sharing (ICS) 
@rem 建议： 手动
sc config   Netman start= DEMAND 

@rem Network Location Awareness (NLA) 
@rem 微软： 收集并存放网络设定和位置信息，并且在这个信息变更时通知应用程序。 
@rem 补充： 如果不使用 ICF 和 ICS 可以关了它 
@rem 依存： AFD网络支持环境、TCP/IP Procotol Driver、Internet Connection Firewall (ICF) / Internet Connection Sharing (ICS) 
@rem 建议： 已停用 
sc config   Nla start= DISABLED 

@rem  File Replication
@rem  允许在多个服务器上自动同时复制和管理文件。如果此服务被终止，文件复制将不会进行并且服务器也不会同步。如果此服务被禁用，@rem 任何依赖它的服务将无法启动。
sc config   NtFrs start= DEMAND 

@rem NT LM Security Support Provider (NTLM 安全性支持提供者) 
@rem 微软： 为没有使用命名管道传输的远程过程调用 (RPC) 程序提供安全性。 
@rem 补充： 如果不使用 Message Queuing 或是 Telnet Server 那就关了它 
@rem 依存： Telnet 
@rem 建议： 已停用 
sc config   NtLmSsp start= DISABLED 

@rem @rem ovable Storage (卸除式存放装置) 
@rem 微软： None 
@rem 补充： 除非你有 Zip 磁盘驱动器或是 USB 之类可携式的硬件或是 Tape 备份装置，不然可以尝试关了 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： DISABLED  
sc config   NtmsSvc start= DEMAND 

@rem  Office Source Engine (office 2003)
@rem  可保存用于更新和修复的安装文件，并且在下载安装程序更新和 Watson 错误报告时必须使用。
@rem  sc config   ose start= DEMAND 

@rem Plug and Play (随插随用) 
@rem 微软： 启用计算机以使用者没有或很少的输入来识别及适应硬件变更，停止或停用这个服务将导致系统不稳定。 
@rem 补充： 顾名思义就是 PNP 环境 
@rem 依存： Logical Disk Manager、Logical Disk Manager Administrative Service、Messenger、Smart Card、Telephony、Windows Audio 
@rem 建议： 自动
sc config   PlugPlay start= AUTO 

@rem IPSEC Services (IP 安全性服务) 
@rem 微软： 管理 IP 安全性原则并启动 ISAKMP/Oakley (IKE) 及 IP 安全性驱动程序。 
@rem 补充： 协助保护经由网络传送的数据。IPSec 为一重要环节，为虚拟私人网络 (VPN) 中提供安全性，而 VPN 允许组织经由因特网安全@rem 地传输数据。在某些网域上也许需要，但是一般使用者大部分是不太需要的 
@rem 依存： IPSEC driver、remote Procedure Call (RPC)、TCP/IP Protocol Driver 
@rem 建议： 手动 
sc config   PolicyAgent start= DEMAND 


@rem Protected Storage (受保护的存放装置) 
@rem 微软： 提供受保护的存放区，来储存私密金钥这类敏感数据，防止未授权的服务、处理、或使用者进行存取。 
@rem 补充： 用来储存你计算机上密码的服务，像 Outlook、拨号程序、其它应用程序、主从架构等等 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 自动 
sc config   ProtectedStorage start= AUTO 

@rem remote Access Auto Connection Manager (远程访问自动联机管理员) 
@rem 微软： 当程序参照到远程 DNS 或 NetBIOS 名称或地址时，建立远程网络的联机。 
@rem 补充： 有些 DSL/Cable 提供者，可能需要用此来处理登入程序 
@rem 依存：remote Access Connection Manager、Telephony 
@rem 建议： 手动 
sc config   RasAuto start= DEMAND 

@rem remote Access Connection Manager (远程访问联机管理员) 
@rem 微软： 建立网络联机。 
@rem 补充： 网络联机用 
@rem 依存： Telephony、Internet Connection Firewall (ICF) / Internet Connection Sharing (ICS)、remote Access Auto @rem  Connection Manager 
@rem 建议： 手动 
sc config   RasMan start= DEMAND 

@rem remote Desktop Help Session Manager 
@rem 微软： 管理并控制远程协助。如果此服务停止的话，远程协助将无法使用。停止此服务之前，请先参阅内容对话框中的 [依存性]标签。 
@rem 补充： 如上说的管理和控制远程协助，如果不使用可以关了 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： DISABLED 
sc config   RDSessMgr start= DISABLED 

@rem Routing andremote Access (路由和远程访问) 
@rem 微软： 提供连到局域网络及广域网络的公司的路由服务。 
@rem 补充： 如上说的，提供拨号联机到区网或是 VPN 服务，一般用户用不到 
@rem 依存：remote Procedure Call (RPC)、NetBIOSGroup 
@rem 建议： 已停用
sc config   remoteAccess start= DISABLED 

@rem remote Registry (远程登录服务) 
@rem 微软： 启用远程使用者修改这个计算机上的登录设定。如果这个服务被停止，登录只能由这个计算机上的使用者修改。如果这个服务被@rem 停用，任何明确依存于它的服务将无法启动。 
@rem 补充： 基于安全性的理由，如果没有特别的需求，建议最好关了它，除非你需要远程协助修改你的登录设定 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   remoteRegistry start= DISABLED 


@rem remote Procedure Call (RPC) Locator (远程过程调用定位程序) 
@rem 微软： 管理 RPC 名称服务数据库。 
@rem 补充： 如上说的，一般计算机上很少用到，可以尝试关了 
@rem 依存： Workstation 
@rem 建议： DISABLED 
sc config   RpcLocator start= DISABLED 

@rem remote Procedure Call (RPC) (远程过程调用，RPC) 
@rem 微软： 提供结束点对应程序以及其它 RPC 服务。 
@rem 补充： 一些装置都依存它，别去动它 
@rem 依存： 太多了，自己去看看 
@rem 建议： 自动 
sc config   RpcSs start= AUTO 

@rem  Resultant Set of Policy Provider
@rem  启用用户连接到远程计算机，访问该计算机的 Windows Management Instrumentation 数据库，并验证计算机的当前组策略设置或在应@rem 用设置之前检查它。如果此服务被停用，远程验证将不可用。如果此服务被禁用，任何依赖于它的服务将无法启用。
sc config   RSoPProv start= DEMAND 

@rem  Special Administration Console Helper
@rem  允许管理员使用紧急管理服务远程访问命令行提示符。
sc config   sacsvr start= DISABLED 

@rem Security Accounts Manager (安全性账户管理员) 
@rem 微软： 储存本机账户的安全性信息。 
@rem 补充： 管理账号和群组原则(gpedit.msc)应用 
@rem 依存：remote Procedure Call (RPC)、Distributed Transaction Coordinator 
@rem 建议： 自动 
sc config   SamSs start= AUTO 

@rem Smart Card (智慧卡) 
@rem 微软： 管理这个计算机所读取智能卡的存取。如果这个服务被停止，这个计算机将无法读取智能卡。如果这个服务被停用，任何明确依@rem 存于它的服务将无法启动。 
@rem 补充： 如果你不使用 Smart Card ，那就可以关了 
@rem 依存： Plug and Play 
@rem 建议： 已停用 
sc config   SCardSvr start= DISABLED 

@rem Task Scheduler (工作排程器) 
@rem 微软： 让使用者能够在这个计算机上设定和排定自动的工作。如果停止这个服务，这些工作在它们排定的时间时将不会执行。
@rem 补充： 设定排定自动的工作，像一些定时磁盘扫瞄、病毒定时扫瞄、更新等等 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 自动
sc config   Schedule start= AUTO 

@rem Secondary Logon 
@rem 微软： 启用在其它认证下的起始程序。如果这个服务被停止，这类的登入存取将无法使用。
@rem 补充： 允许多个使用者处理程序，执行分身等 
@rem 建议： 自动 
sc config   seclogon start= AUTO 

@rem System Event Notification (系统事件通知) 
@rem 微软： 追踪诸如 Windows 登入、网络、和电源事件的系统事件。通知这些事件的 COM+ 事件系统订阅者。 
@rem 补充： 如上所说的 
@rem 依存： COM+ Event System 
@rem 建议： 自动
sc config   SENS start= AUTO 

@rem Internet Connection Firewall (ICF) / Internet Connection Sharing (ICS) 
@rem 微软： 为您的家用网络或小型办公室网络提供网络地址转译、寻址及名称解析服务和/或防止干扰的服务。 
@rem 补充： 如果你不使用因特网联机共享(ICS)或是 XP 内含的因特网联机防火墙(ICF)你可以关掉 
@rem 依存： Application Layer Gateway Service、Network Connections、Network Location Awareness(NLA)、remote Access Connection @rem  Manager 
@rem 建议： 已停用 
sc config   SharedAccess start= DEMAND 

@rem Shell Hardware Detection 
@rem 微软： 为自动播放硬件事件提供通知。 
@rem 补充： 一般使用在记忆卡或是CD装置、DVD装置上 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 自动 
sc config   ShellHWDetection start= AUTO 

@rem Print Spooler (打印多任务缓冲处理器) 
@rem 微软： 将档案加载内存中以待稍后打印。 
@rem 补充： 如果没有打印机，可以关了 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   Spooler start= DEMAND 

@rem Windows Image Acquisition (WIA) (Windows影像取得程序) 
@rem 微软： 为扫描仪和数字相机提供影像撷取服务。 
@rem 补充： 如果扫描仪和数字相机内部具有支持WIA功能的话，那就可以直接看到图档，不需要其它的驱动程序，所以没有扫描仪和数字相机@rem 的使用者大可关了 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   stisvc start= DEMAND 

@rem MS Software Shadow Copy Provider 
@rem 微软： 管理磁盘区阴影复制服务所取得的以软件为主的磁盘区阴影复制。如果停止这个服务，就无法管理以软件为主的磁盘区阴影复制。 
@rem 补充： 如上所说的，用来备份的东西，如 MS Backup 程序就需要这个服务 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   swprv start= DISABLED 

@rem Performance Logs and Alerts (效能记录文件及警示) 
@rem 微软： 基于事先设定的排程参数，从本机或远程计算机收集效能数据，然后将数据写入记录或?#124;发警讯。如果这个服务被停止，将@rem 不会收集效能信息。如果这个服务被停用，任何明确依存于它的服务将无法启动。 
@rem 补充： 没什么价值的服务 
@rem 建议： 已停用 
sc config   SysmonLog start= DISABLED 

@rem Telephony (电话语音) 
@rem 微软： 为本机计算机上及经由局域网络连接到正在执行此服务的服务器上，控制电话语音装置和 IP 为主语音联机的程序，提供电话语@rem 音 API (TAPI) 支持。 
@rem 补充： 一般的拨号调制解调器或是一些 DSL/Cable 可能用到 
@rem 依存： Plug and Play、remote Procedure Call (RPC)、remote Access Connection Manager、remote Access Auto Connection @rem Manager 
@rem 建议： 手动 
sc config   TapiSrv start= DEMAND 

@rem Terminal Services (终端机服务) 
@rem 微软： 允许多位使用者互动连接到同一部计算机、桌面的显示器及到远程计算机的应用程序。远程桌面的加强 (包含系统管理员的 RD)@rem 、快速切换使用者、远程协助和终端机服务器。 
@rem 补充： 远程桌面或是远程协助的功能，不需要就关了 
@rem 依存：remote Procedure Call (RPC)、Fast User Switching Compatibility、InteractiveLogon 
@rem 建议： 已停用
sc config   TermService start= DISABLED 

@rem Themes 
@rem 微软： 提供使用者经验主题管理。 
@rem 补充： 很多人使用布景主题，不过如果没有使用的人，那就可以关闭 
@rem 建议： 自动 
sc config   Themes start= AUTO 


@rem  Distributed Link Tracking Server
@rem  启用同域内的分布式链接跟踪客户端服务，以便在同域内提供更高的可靠性和有效维护。
sc config   TrkSvr start= DISABLED 

@rem Distributed Link Tracking Client (分布式连结追踪客户端) 
@rem 微软： 维护计算机中或网络网域不同计算机中 NTFS 档案间的连结。 
@rem 补充： 维护区网内不同计算机之间的档案连结 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用
sc config   TrkWks start= DISABLED 



sc config   Tssdis start= DISABLED 




sc config   UMWdf start= DEMAND 



@rem Uninterruptible Power Supply (不断电供电系统) 
@rem 微软： 管理连接到这台计算机的不断电电源供应 (UPS)。 
@rem 补充： 不断电电源供应 (UPS)一般人有用到吗？除非你的电源供应器有具备此功能，不然就关了 
@rem 建议： 已停用 
sc config   UPS start= DISABLED 


sc config   vds start= DEMAND 

@rem Volume Shadow Copy 
@rem 微软： 管理及执行用于备份和其它目的的磁盘区卷影复制。如果这个服务被停止，卷影复制将无法用于备份，备份可能会失败。
@rem 补充： 如上所说的，用来备份的?#124;西，如 MS Backup 程序就需要这个服务 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用
sc config   VSS start= DISABLED 

@rem Windows Time (Windows 时间设定) 
@rem 微软： 维护在网络上所有客户端及服务器的数据及时间同步处理。如果这个服务停止，将无法进行日期及时间同步处理。如果这个服务@rem 被停用，所有依存的服务都会停止。 
@rem 补充： 网络对时校准用的，没必要就关了 
@rem 建议： 已停用 
sc config   W32Time start= DISABLED 

@rem WebClient 
@rem 微软： 启用 Windows 为主的程序来建立、存取，以及修改因特网为主的档案。如果停止这个服务，这些功能将无法使
@rem 补充： 使用 WebDAV 将档案或数据夹上载到所有的 Web 服务，基于安全性的理由，你可以尝试关闭 
@rem 依存： WebDav Client Redirector 
@rem 建议： 已停用
sc config   WebClient start= DISABLED 

@rem  WinHTTP Web Proxy Auto-Discovery Service
@rem  实现 Windows HTTP 服务(WinHTTP)的 Web 代理自动发现服务(WPAD)。WPAD 是用于启用 HTTP 客户端自动发现代理配置的协议。如果此@rem 服务被停用或禁用，WPAD 协议将在 HTTP 客户端的进程中执行，而不是在外部服务进程；因此不会造成功能损失。
sc config   WinHttpAutoProxySvc start= DEMAND 


@rem Windows Management Instrumentation (WMI) 
@rem 微软： 提供公用接口及对象模型，以存取有关操作系统、装置、应用程序及服务的管理信息。如果这个服务已停止，大多数的 Windows @rem 软件将无法正常工作。如果这个服务已停用，所有依存于它的服务都将无法启动。 
@rem 补充： 如上说的，是一种提供一个标准的基础结构来监视和管理系统资源的服务，由不得你动他 
@rem 依存： Event Log、remote Procedure Call (RPC) 
@rem 建议： 自动
sc config   winmgmt start= AUTO 

@rem Portable Media Serial Number 
@rem 微软： Retrieves the serial number of any portable music player connected to your computer 
@rem 补充： 透过联机计算机重新取得任何音乐拨放序号？没什么价值的服务 
@rem 建议： 已停用 
sc config   WmdmPmSN start= DISABLED 

@rem Windows Management Instrumentation Driver Extensions (Windows Management Instrumentation 驱动程序延伸) 
@rem 微软： 提供系统管理信息给予/取自驱动程序。 
@rem 补充： Windows Management Instrumentation 的延伸，提供信息用的 
@rem 建议： 手动 	
sc config   Wmi start= DEMAND 

@rem WMI Performance Adapter 
@rem 微软： 提供来自 WMIHiPerf 提供者的效能链接库信息。 
@rem 补充： 如上所提 
@rem 依存：remote Procedure Call (RPC) 
@rem 建议： 已停用
sc config   WmiApSrv start= DISABLED 

@rem Automatic Updates 
@rem 微软： 启用重要 Windows 更新的下载及安装。如果停用此服务，可以手动的从 Windows Update 网站上更新操作系统。 
@rem 补充： 允许 Windows 于背景自动联机之下，到 Microsoft Servers 自动检查和下载更@rem 新修补程序 
@rem 建议： 已停用 
sc config   wuauserv start= DISABLED 

@rem Wireless Zero Configuration 
@rem 微软： 为 802.11 适配卡提供自动设定 
@rem 补充： 自动配置无线网络装置，言下之意就是说，除非你有在使用无线网络适配卡装置，那么你才有必要使用这个网络零管理服务 
@rem 依存： NDIS Usermode I/O Protocol、remote Procedure Call (RPC) 
@rem 建议： 已停用 
sc config   WZCSVC start= DISABLED 


@rem  Network Provisioning Service
@rem  在域内为自动网络提供管理 XML 配置文件。
sc config   xmlprov start= DEMAND 

@pause 
