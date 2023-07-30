package crisp.chat.sdk.crisp_chat_sdk


import android.app.Activity
import android.content.Context
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import im.crisp.client.ChatActivity
import im.crisp.client.Crisp
import im.crisp.client.data.Company
import im.crisp.client.data.Employment
import im.crisp.client.data.Geolocation
import im.crisp.client.data.SessionEvent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.net.URL
import kotlin.math.log


class CrispChatSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var context: Context
    private lateinit var activity: Activity

    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "crisp_chat_sdk")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext

    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "configure") {
            Crisp.configure(context, call.arguments.toString())
            result.success("Android Crisp sdk initialized successful");
        } else if (call.method == "setTokenID") {
            Crisp.setTokenID(context, call.arguments.toString())
            result.success("Android Crisp sdk setTokenID successful");
        } else if (call.method == "resetChatSession") {
            Crisp.resetChatSession(context)
            result.success("Android Crisp sdk resetChatSession successful");
        } else if (call.method == "setUserAvatar") {
            Crisp.setUserAvatar(call.arguments.toString())
            result.success("Android Crisp sdk setUserAvatar successful");
        } else if (call.method == "setUserCompany") {
            val map = call.arguments as HashMap<String, Any>
            var name: String? = null;
            var url: URL? = null;
            var companyDescription: String? = null;
            var employment: Employment? = null;
            var geolocation: Geolocation? = null;
            if (map["name"] != null) {
                name = map["name"].toString();
            }
            if (map["url"] != null) {
                url = URL(map["url"].toString())
            }
            if (map["companyDescription"] != null) {
                companyDescription = map["companyDescription"].toString()
            }
            if (map["employment"] != null) {
                val employmentJson = map["employment"] as HashMap<String, Any>
                employment = Employment(
                    employmentJson["title"].toString(),
                    employmentJson["role"].toString()
                )
            }
            if (map["geolocation"] != null) {
                val geolocationJson = map["geolocation"] as HashMap<String, Any>
                geolocation = Geolocation(
                    geolocationJson["city"].toString(),
                    geolocationJson["country"].toString()
                )
            }
            Crisp.setUserCompany(Company(name, url, companyDescription, employment, geolocation))
            result.success("Android Crisp sdk setUserCompany successful");
        } else if (call.method == "setUserEmail") {
            Crisp.setUserEmail(call.arguments.toString())
            result.success("Android Crisp sdk setUserEmail successful");
        } else if (call.method == "setUserNickname") {
            Crisp.setUserNickname(call.arguments.toString())
            result.success("Android Crisp sdk setUserNickname successful");
        } else if (call.method == "setUserPhone") {
            Crisp.setUserPhone(call.arguments.toString())
            result.success("Android Crisp sdk setUserPhone successful");
        } else if (call.method == "setSessionBool") {
            val map = call.arguments as HashMap<String, Any>
            Crisp.setSessionBool(map["key"].toString(), map["value"] as Boolean)
            result.success("Android Crisp sdk setSessionBool successful");
        } else if (call.method == "setSessionInt") {
            val map = call.arguments as HashMap<String, Any>
            Crisp.setSessionInt(map["key"].toString(), map["value"] as Int)
            result.success("Android Crisp sdk setSessionInt successful");
        } else if (call.method == "setSessionString") {
            val map = call.arguments as HashMap<String, Any>
            Crisp.setSessionString(map["key"].toString(), map["value"].toString())
            result.success("Android Crisp sdk setSessionString successful");
        } else if (call.method == "setSessionSegment") {
            Crisp.setSessionSegment(call.arguments.toString())
            result.success("Android Crisp sdk setSessionSegment successful");
        }  else if (call.method == "openCrisp") {
            activity.startActivity(Intent(context, ChatActivity::class.java))
            result.success("Android Crisp sdk loaded successful")
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity;
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onDetachedFromActivity() {

    }
}
