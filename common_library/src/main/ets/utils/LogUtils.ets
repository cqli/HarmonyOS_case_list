/**
 * 日志打印工具类
 */
import hilog from '@ohos.hilog'

export class LogUtils {
  /**
   * 日志对应的领域标识，范围是0x0~0xFFFF。
   * 建议开发者在应用内根据需要自定义划分。
   * 这个领域标识应该还没完全理解。。。。。。。。。。。
   */
  private static mDomain = 0x0001
  /**
   * 日志打印tag
   */
  private static LOG_TAG = "阿强的HOS"
  private static mLogSize = 800 //打印的最大长度，默认是800
  private static mHilog: boolean = true //默认是用hilog进行打印
  /**
   * 详细的流程记录，通过该级别的日志可以更详细地分析业务流程和定位分析问题。
   */
  static logDebug(message: String) {
    if (hilog.isLoggable(this.mDomain, this.LOG_TAG, hilog.LogLevel.DEBUG)) {
      this.logLevel(hilog.LogLevel.DEBUG, this.LOG_TAG, message)
    }
  }
  /**
   * 用于记录业务关键流程节点，可以还原业务的主要运行过程；
   * 用于记录可预料的非正常情况信息，如无网络信号、登录失败等。
   * 这些日志都应该由该业务内处于支配地位的模块来记录，避免在多个被调用的模块或低级函数中重复记录。
   */
  static logInfo(message: String) {
    if (hilog.isLoggable(this.mDomain, this.LOG_TAG, hilog.LogLevel.INFO)) {
      this.logLevel(hilog.LogLevel.INFO, this.LOG_TAG, message)
    }
  }
  /**
   * 用于记录较为严重的非预期情况，但是对用户影响不大，
   * 应用可以自动恢复或通过简单的操作就可以恢复的问题。
   */
  static logWarn(message: String) {
    if (hilog.isLoggable(this.mDomain, this.LOG_TAG, hilog.LogLevel.WARN)) {
      this.logLevel(hilog.LogLevel.WARN, this.LOG_TAG, message)
    }
  }
  /**
   * 应用发生了错误，该错误会影响功能的正常运行或用户的正常使用，
   * 可以恢复但恢复代价较高，如重置数据等。
   */
  static logError(message: String) {
    if (hilog.isLoggable(this.mDomain, this.LOG_TAG, hilog.LogLevel.ERROR)) {
      this.logLevel(hilog.LogLevel.ERROR, this.LOG_TAG, message)
    }
  }
  /**
   * 重大致命异常，表明应用即将崩溃，故障无法恢复。
   */
  static logFatal(message: String) {
    if (hilog.isLoggable(this.mDomain, this.LOG_TAG, hilog.LogLevel.FATAL)) {
      this.logLevel(hilog.LogLevel.FATAL, this.LOG_TAG, message)
    }
  }

  /*
  *统一输出日志
  * */
  private static async logLevel(level: hilog.LogLevel, tag: string, message: any) {
    // const content = this.getMessage(level, tag, message) //最终的内容展示
    const content = JSON.stringify(JSON.parse(message), null, "   ") //最终的内容展示
    const len = content.length / this.mLogSize
    for (var i = 0; i < len; i++) {
      var con = content.substring(i * this.mLogSize, (i + 1) * this.mLogSize)
      if (i != 0) {
        con = "|" + con
      }
      //打印日志
      if (this.mHilog) {
        //使用hilog
        switch (level) {
          case hilog.LogLevel.INFO: //info
            hilog.info(this.mDomain, tag, con)
            break
          case hilog.LogLevel.WARN: //WARN
            hilog.warn(this.mDomain, tag, con)
            break
          case hilog.LogLevel.DEBUG: //DEBUG
            hilog.debug(this.mDomain, tag, con)
            break
          case hilog.LogLevel.ERROR: //ERROR
            hilog.error(this.mDomain, tag, con)
            break
          case hilog.LogLevel.FATAL: //FATAL
            hilog.fatal(this.mDomain, tag, con)
            break
        }
      } else {
        //使用console
        switch (level) {
          case hilog.LogLevel.INFO: //info
            console.info(con)
            break
          case hilog.LogLevel.WARN: //WARN
            console.warn(con)
            break
          case hilog.LogLevel.DEBUG: //DEBUG
            console.debug(con)
            break
          case hilog.LogLevel.ERROR: //ERROR
            console.error(con)
            break
          case hilog.LogLevel.FATAL: //FATAL
            console.log(con)
            break
        }
      }
    }
  }

  /**
   * 获取输出位置
   * */
  getMessage(level: hilog.LogLevel, tag: string, message: any): string {
    var log = "┌───────" + tag + "────────────────────────────────────────────────────────────────────────────────"
    log = log.substring(0, log.length - tag.length) + "\n"

    try {
      if (level == hilog.LogLevel.ERROR) {
        //展示位置
        const stackTrace = new Error().stack
        const traceArray = stackTrace.split('\n')
        const trace = traceArray[traceArray.length-2]
        log = log + "|" + trace
      }

      var type = typeof message
      if (type == "object") {
        //是对象
        message = this.getObjectToJson(message)
      } else if (type == "string") {
        //判断是否包含大括号
        const content = message + ""
        if (content.startsWith("{") && content.endsWith("}")) {
          //对象
          const obj = JSON.parse(message)
          message = this.getObjectToJson(obj)
        } else {
          message = content
        }
      }
      log = log + "\n|    " + message
    } catch (e) {

    }
    log = log + "\n└───────────────────────────────────────────────────────────────────────────────────────"
    return log
  }

  /*
   *对象转Json
   * */
  private getObjectToJson(message: object): String {
    const json = JSON.stringify(message, null, 2)
    const endMessage = json.replace(/\n/g, "\n|    ")
    return endMessage
  }
}

