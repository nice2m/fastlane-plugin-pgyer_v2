# pgyer_v2 plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-pgyer_v2)


## 感谢[shishirui](https://github.com/shishirui)，实现[pgyer 0.1.0](https://github.com/shishirui/fastlane-plugin-pgyer)

## 开始

### 第一步：

覆盖以下内容到`fastlane\Pluginfile`文件内；

```bash
gem 'fastlane-plugin-pgyer_v2',git: 'https://github.com/nice2m/fastlane-plugin-pgyer_v2'

```


### 第二步：
```bash
cd [项目根目录下]

bundle update
```


## 关于 pgyer_v2


### 原有实现 &问题

[原有实现](https://github.com/shishirui/fastlane-plugin-pgyer)

原有插件未能获取类似于releaseId 的字段，一旦测试需要特殊的历史版本，需要每次到蒲公英控制台去获取下载地址；不是很方便;

#### 新版本
pgyer_v2，ipa 文件成功后的，解析类似于releaseId 字段，appIcon 哈希字段到 
`fastlane\pgyer_upload_note_file.txt`中,以空格分隔；


iap上传完成服务器返回json

```
{"code"=>0, "message"=>"", "data"=>{"appKey"=>"177d2bd5e3803dec08f36019d111034c", "userKey"=>"192ef1e7f5aafe7c5dfcfef44e3bcc", "appType"=>"1", "appIsLastest"=>"1", "appFileSize"=>"11331563", "appName"=>"美团", "appVersion"=>"1.1.12", "appVersionNo"=>"7", "appBuildVersion"=>"23", "appIdentifier"=>"com.tck.kidian", "appIcon"=>"f84c225a92edea360e837eb0decd8fe2", "appDescription"=>"美团是一款基于餐饮服务商和业务员的服务平台，以即时沟通为切入点，以专业服务作为产品特色和卖点，为餐饮服务商和业务员提供全面的服务和管理，包括：业务拓展、订单跟踪、客户拜访、个人信息等；", "appUpdateDescription"=>"测试服", "appScreenshots"=>"c9de904652e53a17ca47441344a37f6,ac61a777e6907466f054aa015c4d24e5,a2315a507bbe2e4598803327353bd6", "appShortcutUrl"=>"JfsN", "appCreated"=>"2020-06-22 18:45:34", "appUpdated"=>"2020-06-22 18:45:34", "appQRCodeURL"=>"http://www.pgyer.com/app/qrcodeHistory/9745d846808cf47eec73459135c65a0201158f01bc7f458f8f7304e208594"}}

```


## Fastfile配置参考
```ruby
lane :beta do
    gym
    pgyer(
        api_key: <pgy_api_key>, 
        user_key: <pgy_user_key>,
        update_description: [pgy_release_note]
    )

    # pgyer_v2 插件生成的txt文件，获取到图标，下载地址
    pgyer_upload_note_file_name = "./pgyer_upload_note_file.txt"
    pgyer_note_content = IO.read(pgyer_upload_note_file_name)
    notes_info_list = pgyer_note_content.split(" ")

    # 带releaseId 的app下载链接
    app_down_load_url = notes_info_list[0]
    # 带hash 的appIcon 图片链接
    app_icon_url = notes_info_list[1]

    puts app_down_load_url
    puts app_icon_url
end
	
```


## 问题反馈

请直接提issue

[官网文档参考](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) 
