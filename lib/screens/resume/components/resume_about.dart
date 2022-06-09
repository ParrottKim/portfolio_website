import 'package:flutter/material.dart';

class ResumeAbout extends StatelessWidget {
  const ResumeAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              width: 160.0,
              child: Text(
                'ABOUT ME',
                style: TextStyle(
                  fontFamily: 'Bebas Neue',
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 0.3,
                width: double.infinity,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Text(
          '''안녕하세요. Flutter를 주력으로 개발하고 있는 개발자 김현진입니다.
현재 재직중인 회사는 자동차 MES 위주 사업과, C#과 SQL 서버를 주력으로 하고 있습니다. 하지만 고객사 중심의 환경은 개발 보다는 전화응대와 유지보수가 우선이었고 제가 원하는 개발자로서의 능력을 키우는 것에는 한계가 있다고 생각했습니다.
그래서 스스로 성장시킬 수 있는 기회를 찾기 위해 퇴근 후 Flutter 독학을 시작했습니다.
모든 것을 혼자 해결해야하는 어려움이 있었지만, 학창 시절에도 새로운 분야를 배울 때도 헤쳐나가고자 하면 결국에는 정답이 보인다는 것을 알고 있었고, 그 경험을 토대로 스스로 만족할 수 있을 정도의 레벨에 도달했습니다.
많은 고민이 있었지만 새로운 시작을 하기로 마음 먹은 지금, 저보다 많은 경험과 스킬을 가진 동료들과 협업하며 부족한 점을 채우고, 이제는 제가 하고자 하던 사용자 중심의 서비스 개발을 배울 수 있는 기회가 되었으면 하는 바람입니다.''',
          style: TextStyle(
            fontFamily: 'SCDREAM',
            fontWeight: FontWeight.w500,
            fontSize: 12.0,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
