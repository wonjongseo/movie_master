import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ja_JP': {},
        'ko_KR': {},
        'en_US': {},
      };
}

class AppString {
  static String cancelBtnTextTr = "cancelBtnTextTr";
  static String cancelBtnTextKr = '취소';
  static String cancelBtnTextJp = "取消";
  static String cancelBtnTextEn = "Cancel";

  static String plzAlarmTime = "plzAlarmTimeTr";
  static String plzAlarmTimeKr = "알림 시간을 입력해주세요";
  static String plzAlarmTimeJp = "アラーム時間を入力してください";
  static String plzAlarmTimeEn = "Please enter alarm time";

  static String plzInputCollectTime = "plzInputCollectTimeTr";
  static String plzInputCollectTimeKr = "올바른 형식의 시간을 입력해주세요";
  static String plzInputCollectTimeJp = "正しい形式の時間を入力してください";
  static String plzInputCollectTimeEn = "Please enter a valid format of time";

  static String hour = "timeTr";
  static String hourKr = '시';
  static String hourJp = "時";
  static String hourEn = "Time";

  static String minute = "minuteTr";
  static String minuteKr = '분';
  static String minuteJp = "分";
  static String minuteEn = "Minute";

  static String copyWordMsg = "copyWordMsgTr";
  static String copyWordMsgKr = '가\n 복사(Ctrl + C) 되었습니다.';
  static String copyWordMsgJp = "が\n コピー(Ctrl + C)されました。";
  static String copyWordMsgEn = "";
}
