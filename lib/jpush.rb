
module JPush

  #V3
  autoload :JPushClient,'jpush/jpush_client.rb'
  autoload :NativeHttpClient,'jpush/http_client'
  autoload :PushClient,'jpush/push_client'
  autoload :ReportClient,'jpush/report_client'
  autoload :Audience,'jpush/model/audience'
  autoload :Message,'jpush/model/message'
  autoload :Options,'jpush/model/options'
  autoload :Platform,'jpush/model/platform'
  autoload :PushPayload,'jpush/model/push_payload'
  autoload :AndroidNotification,'jpush/model/notification/android_notification'
  autoload :IOSNotification,'jpush/model/notification/ios_notification'
  autoload :WinphoneNotification,'jpush/model/notification/winphone_notification'
  autoload :Notification,'jpush/model/notification/notification'
  autoload :PushResult, 'jpush/model/push_result'
  autoload :ReceivedsResult, 'jpush/model/receiveds_result'
end
