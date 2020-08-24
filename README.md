# golf项目搭建过程和遇到的困难以及如何解决的

> 第一次设计数据库所以引进flyway进行数据库版本控制管理，防止后期由于数据库结构问题导致业务问题。

+ 添加spring web、lombok、flyway(数据库版本控制管理工具)、mysql驱动依赖。

+ 创建mysql数据库golf。

+ 编写application.yml配置文件配置本地mysql数据库(golf),数据库编码为GBK。

+ 目前golf项目集成flyway不成功(测试在其他项目上可以使用，正在检查两个项目配置区别)，实测flyway没有mybatis-plus的依赖不会运行，加入依赖后正常使用。

+ 加入mybatis generator插件自动生成实体类、dao层、xml文件的代码，在自动生成代码时，连接数据库时区异常，实测在mysql驱动8.0.15中，在数据库驱动的url后加入serverTimezone=UTC参数无效，只有在MySQL中执行命令：set global time_zone='+8:00'才可以正常生成代码。

+ 自动生成完实体类和dao层、xml代码后，想要测试接口，在mapper接口中使用@select注解接口可以使用，但是使用xml映射文件中的sql，报绑定异常的错误，代码是通过mybatis genrator自动生成xml映射文件和mapper接口应该没有问题，那错误的就是无法读取xml配置文件，看了一下配置文件发现没有问题，看了半天网上如何写xml映射文件的配置但是还是报绑定异常，之后发现将xml配置文件在resources目录下创建和mapper接口相同的路径即可不需要配置xml配置文件的路径，甚至不需要配置mapper接口上的@Mapper注解。

![mapper接口映射xml配置文件](https://github.com/mxl656565/folg/blob/master/src/main/resources/image/mapper%E6%98%A0%E5%B0%84xml%E6%96%87%E4%BB%B6.png)


+ 加入swagger依赖生成api接口文档，但是需要一个一个给model字段加入注解很不方便，就想借鉴mall项目的方法，通过mybatis generator生成代码自定义model实体类字段的注解，给每个字段上添加@apimodelproperty,并且注解中的value值从数据库中读取注释，之后就加入自定义的注释类需要在generator的xml文件中配置，还需要写通过java实现的generator生成代码，之后就可以自动生成model字段上的自定义注解.


> 参考vhr项目
# 数据库表设计

+ hr表是用户表，存放了用户的基本信息。

+ role是角色表，name字段表示角色的英文名称，按照SpringSecurity的规范，将以ROLE_开始，nameZh字段表示角色的中文名称。

+ menu表是一个资源表，该表涉及到的字段有点多，由于我的前端采用了Vue来做，因此当用户登录成功之后，系统将根据用户的角色动态加载需要的模块，所有模块的信息将保存在menu表中，menu表中的path、component、iconCls、keepAlive、requireAuth等字段都是Vue-Router中需要的字段，也就是说menu中的数据到时候会以json的形式返回给前端，再由vue动态更新router，menu中还有一个字段url，表示一个url pattern，即路径匹配规则，假设有一个路径匹配规则为/admin/**,那么当用户在客户端发起一个/admin/user的请求，将被/admin/**拦截到，系统再去查看这个规则对应的角色是哪些，然后再去查看该用户是否具备相应的角色，进而判断该请求是否合法。
