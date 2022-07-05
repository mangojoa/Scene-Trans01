//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 이두산 on 2022/06/20.
//

import UIKit

class ViewController: UIViewController {

    /* [22.06.29] 화면 전환 기법1 : 뷰를 이용한 화면 전환
     IOS에서 화면을 전환할 때 사용할 수 있는 첫 번째 방법은 뷰를 사용하는 것입니다.
     이를 자세하게 풀어서 설명하자면...
     a. 하나의 view controller 안에 두 개의 루트 뷰를 준비한 다음 -> 상태에 따라 뷰를 적절히 교체해 주는 것
     필요에 따라 뷰를 완전히 바꿔치기하거나, 단순히 기존 뷰 위에 다른 뷰를 덮어 가려지게 할 수도 있다.
     
     그러나 이 방식은 하나의 뷰 컨트롤러가 듀 개 이상의 루트 뷰를 관리해야 하므로 기리 좋은 방법이 아니다.
     IOS에서는 하느이 뷰 컨트롤러 아해에 하나의 루트 부를 관리하는 MVC패턴을 기본으로 하는데, 위에서 설명한 방식은 이 같은 구조와 반대되는 구조이다...
     
     b. 뷰를 이용하면 화면을 전환하면서도 하나의 view controller가 하나의 루트 뷰만 관리하게 할 수 있는 방법도 있습니다.
     다른 view controller에 올려진 루트 뷰를 가져와 표시하는 그림과 같은 방식이다.
     그러나 이 방법도 역시 view controller 내부에 있어야 할 뷰가 다른 view controller로 옮겨가 버리므로 뷰를 제어할 책인을 지는 컨트롤러가 모호해지는 단점이 있습니다.
     또한 이렇게 뷰가 교체된 상태에서 내비게이션 컨트롤러를 이용하여 화면을 전환하게 되면 뷰 컨트롤러는 전환되는데 해당 뷰는 그대로 유지되는 등
     루트 뷰와 뷰 컨트롤러의 불일치 현상이 발생한다.
     
     뷰를 이용한 화면전환은 이전 화면으로 되돌아가는 방식에 대한 처리 등 고려해야할 사항이 꽤 많습니다.
     될 수 있으면 뷰를 이용한 화면 전환은 지양한다.
     
     [22.06.30] 화면 전환 기법2 : 뷰 컨트롤러 직접 호출에 의한 화면 전환
     현재의 뷰 컨트롤러에서 이동할 대상 뷰 컨트롤러를 직접 호출해서 화면을 표시하는 방식이다.
     직접 표시한다는 의미에서 '프레젠테이션 방식'이라고 부르기도 한다.
     
     화면을 표시하는 모든 뷰 컨트롤러는 UIViewController 클래스를 상속받는데, 이 클래스에서 정의된 다음 메소드를 사용하면 화면을 전환할 수 있다.
     present(_:animated:)
     
     이 메소드를 분석하면
     present(<새로운 뷰 컨트롤러 인스턴스>, animated:<애니메이션 여부>) 이처럼 두 개의 인자값을 입력받는데,
     첫 번째 인자값 -> 새로운 화면을 담당하는 뷰 컨트롤러의 인스턴스입니다.
     프레젠트 메소드는 입력받은 인스턴스를 사용하여 새로운 화면을 스크린에 나타냅니다.
     
     두 번째 인자값 -> 화면을 전환할 때에는 필요에 따라 애니메이션 효과를 줄 수 있다.
     ex) present(_:animated:completion:) -> 때로는 화면 전환이 완료되는 시점에 맞추어 특정 로직을 실행해 주어야 할 경우도 있습니다.
     이때는 위의 메소드를 이용합니다.
     
     큰 차이는 없어보이지만, 세 번째 매개변수가 추가되어 있습니다.
     이 매개변수는 실행 구문을 클로저나 함수 형식으로 입력받아, 화면 전환이 완전히 끝난 후에 호출해주는 역할을 합니다.
     
     [why??? 새 번째 매개변수의 필요성!]
     화면 전환이 완전히 끝난 후에 호출을 해주는 역할 ?? 차라리 화면전환이 끝난 이후에 로직을 작성하면 안되는가?
     => 안될건 없지만, 추천하지는 않는 방법이다.
        화면 전환은 때로 시간이 걸리는 작업이라, 화면 전환 과정이 끝나기를 기다리지 않고 바로 다음 라인에 작성된 코드를 이어서 실행시키기 때문입니다.
     
     이같이 하나의 처리가 끝나기를 기다리지 않고 다음작업을 바로 이어서 수행하는 방식을 [비동기 방식]이라고 한다.
     화면 전환은 비동기 방식으로 동작하기 때문에, 화면 전환이 완전히 끝난 후에 실행해야 할 구문이 있다면
     클로저나 함수 형식으로 작성하여 프레젠트 메소드의 세 번째 인자 값에 넣은 다음, 시스템이 알맞게 호울해 주기를 기다리는게 올바릅니다.
     
     프레젠트 메소드를 이용한 화면 전환은 기존의 뷰 컨트롤러를 그대로 둔 채, 그 위에 새로운 뷰 컨트롤러의 화면을 덮는 방식입니다.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    /* [22.07.05] 화면을 이동할 버튼 생성하기
     화면을 이동할 메소드 moveNext()를 생성 후 화면 이동을 처리하는 코드를 작성하기에 앞서, 이동할 대상이 되는 뷰 컨트롤러를 먼저 추가해야한다.
     
     보조 에디터를 열어 view Controller를 추가하고 화면 구분을 위한 레이블을 추가해보자
     
     추가했다면 여기서
     기존 view controller = a
     신규 view controller = b
     
     b는 a와 달리 생성 직후에는 간결한 스위프트 클래스가 아니라 뭔가 다른 모습의 복잡한 소스 코드가 쓰여져 있다.....(많이 당황스러웠다)
     
     이유는 b에 연결된 클래스가 현재는 UIViewController 클래스 자체이기 때문이라고 한다...
     아마 해당 view Controller는 생성 직후, 어떤 설정도 하지않았기에 복잡한 코드로 된 것이다.(추측)
     */
    
    /* [22.07.05] 그렇다고 ... 화면전환 연결을 포기할 순 없다.
     우선.. b의 스토리보드의 속성값을 이용해야한다.
     b를 선택한 상태에서 아이덴티티 인스펙터 탭을 열고, [Identity] 영역에서 StoryBoardID 항목을 찾아 SecoundVC 라 입력해보자.
     
     여기서 입력한 StoryBoardID는 앞으로 b를 참조할 때 사용될 값이므로 오타가 있어서는 안된다.
     */
    @IBAction func moveNext(_ sender: Any) {
        // 이제 작성된 코드를 살펴보자
        
        /* [22.07.05]
         이동할 뷰 컨트롤러 객체를 StoryBoardID 정보를 이용하여 참조하는 코드
         
         스크린에 새로 표시할 뷰 컨트롤러를 스토리보드로부터 읽어와 인스턴스화 하는 부분이다.
         인자값으로 입력된 StoryBoardID와 일치하는 뷰 컨트롤러를 찾아, 인스턴스를 생성하고 이 값을 받아온다.
         
         이때, 먼저 스토리보드 파일의 내용을 참조할 수 있어야 하는데, Main.storyboard는 self.storyboard 속성을 통해 참조할 수 있다.
         참고로 스토리보드 객체가 참조될 때의 타입은 UIStoryBoard이다.
         
         여기서 문제가 될 수 있는 것이 있다.
         만약 새롭게 생성한 스토리보드가 N개라면? (1 < N)
         기능이나 성격에 따라 화면을 분리하다 보면 때에 따라 스토리보드 파일이 여러새 존재할 수 밖에 없다.
         그렇기에 여러 개의 스토리보드 파일이 존재할 수 있는 상황을 상정하고 원하는 스토리보드만 선택하여 객체로 가져오려면
         self.storyboard 속성을 사용하는 것이 아닌 여러 개의 스토리보드 파일 중에서 원하는 스토리보드를 지정할 수 다음과 같이 구문을 변경해야 한다.
         
         스토리보드 파일명을 인자값으로 넣어 UIStoryboard 객체를 만들어 내고, 이 객체를 self.storyboard 속성 대신 사용하는 방법이다.
         */
        let Main_Storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        /* [22.07.05] 위의 코드를 분석하면?
         초기화 구문에서 사용된 인자값 중 첫 번째 항목은 읽어 들일 스토리보드 파일명을 나타낸다.
         스토리보드 파일이 여러 개 존재할 경우 그 중에서 사용하고자 하는 스토리보드 파일명을 넣으면 된다.
         
         두 번째 인자값은 스토리보드 파일을 읽어들일 위치이다.
         bundle 이라는 이름으로 지정되는데, 완성된 앱은 성격에 맞는 파일끼리 묶어 여러 개의 bundle를 만들어 내는데
         이 중에서 메인 번들은 앱의 주요 소스 코드 파일을 포함하고 있는 번들이다.
         스토리보드 파일도 여기에 포함된다. 그리고 추가적으로 각종 리소스 파일을 묶어 놓은 리소스 번들도 존재한다.
         */
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecoundVC")
        
        /*
         */
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        /*
         */
        self.present(uvc, animated: true)
    }
    
}

