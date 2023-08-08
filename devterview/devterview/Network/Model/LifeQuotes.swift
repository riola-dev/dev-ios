//
//  LifeQuotes.swift
//  devterview
//
//  Created by Yu ahyeon on 2023/08/08.
//

import Foundation

struct LifeQuote {
    let content: String
    let writersName: String
}

let lifeQuotes = [
    LifeQuote(content: "오랫동안 꿈을 그리는 사람은 마침내 그 꿈을 닮아 간다\n오랫동안 꿈을 그리는 사람은 마침내 그 꿈을 닮아 간다", writersName: "마르코폴로"),
    LifeQuote(content: "상황을 가장 잘 활용하는 사람이 가장 좋은 상황을 맞는다.", writersName: "존 우든"),
    LifeQuote(content: "일반적인 것을 잃을 위험을 감수하지 않으면 평범한 것에 만족해야 한다.", writersName: "짐 론"),
    LifeQuote(content: "추구할 수 있는 용기가 있다면 우리의 모든 꿈은 이뤄질 수 있다.", writersName: "월트 디즈니"),
    LifeQuote(content: "열정을 잃지 않고 실패에서 실패로 걸어가는 것이 성공이다.", writersName: "윈스턴 처칠"),
    LifeQuote(content: "기회는 일어나는 것이 아니라 만들어내는 것이다.", writersName: "크리스 그로서"),
    LifeQuote(content: "성공한 사람이 되려고 노력하기보다\n가치있는 사람이 되려고 노력하라.", writersName: "알버트 아인슈타인"),
    LifeQuote(content: "나는 실패한 게 아니다.\n나는 잘 되지 않는 방법 1만 가지를 발견한 것이다.", writersName: "토마스 에디슨"),
    LifeQuote(content: "당신이 허락해주지 않으면 아무도 당신이 열등감을 느끼게 만들 수 없다.", writersName: "엘리너 루즈벨트"),
    LifeQuote(content: "성공적인 삶의 비밀은 무엇을 하는 게\n자신의 운명인지 찾아낸 다음 그걸 하는 것이다.", writersName: "헨리 포드"),
    LifeQuote(content: "괴로운 시련처럼 보이는 것이 뜻밖의 좋은 일일 때가 많다.", writersName: "오스카 와일드"),
    LifeQuote(content: "위대한 것으로 향하기 위해 좋은 것을 포기하는 걸 두려워하지 마라.", writersName: "존 록펠러"),
    LifeQuote(content: "간단하게 설명할 수 없으면 제대로 이해하지 못하는 것이다", writersName: "알버트 아인슈타인"),
    LifeQuote(content: "인생이란 자신을 찾는 것이 아니라 자신을 만드는 것이다. ", writersName: "롤리 다스칼"),
    LifeQuote(content: "지식이란 당신이 뭘 할 수 있는지 아는 것이다. 지혜란 하지 않아야 할 때를 아는 것이다. ", writersName: "미상"),
    LifeQuote(content: "혁신이 지도자와 추종자를 가른다.", writersName: "스티브 잡스"),
    LifeQuote(content: "당신이 세상을 바꿀 수 없다고 말하는 사람에는 두 종류가 있다.\n시도하기를 두려워하는 사람들, 당신이 성공할까 봐 두려워하는 사람들.", writersName: "레이 고포스"),
    LifeQuote(content: "당신이 살면서 어떤 부침을 겪든 간에 생각이 당신의 기본 자산이 되어야 한다.", writersName: "APJ 칼람"),
    LifeQuote(content: "나는 내가 더 노력할수록 운이 더 좋아진다는 걸 발견했다.", writersName: "토마스 제퍼슨"),
    LifeQuote(content: "모든 성취의 시작점은 갈망이다.", writersName: "나폴레온 힐"),
    LifeQuote(content: "성공은 매일 반복한 작은 노력들의 합이다", writersName: "로버트 콜리어"),
    LifeQuote(content: "뛰어난 걸 원하면 오늘 당장 이룰 수 있다.\n지금 당장 뛰어나지 못한 일을 그만둬라.", writersName: "토마스J. 왓슨"),
    LifeQuote(content: "성공을 갈망할 때만 성공할 수 있고, 실패해도 상관없다고 생각할 때만 실패할 수 있다.", writersName: "필리포스"),
    LifeQuote(content: "마치지 않고 죽어도 되는 일만 내일로 미뤄라.", writersName: "파블로 피카소"),
    LifeQuote(content: "사람들은 동기 부여는 오래가지 않는다고 말한다.\n목욕도 마찬가지다. 그래서 매일 하라고하는 것이다.", writersName: "지그 지글러"),
    LifeQuote(content: "우리는 우리가 늘 생각하는 것이 된다. 그것이 가장 묘한 비밀이다.", writersName: "얼 나이팅게일"),
    LifeQuote(content: "성공(success)이 노력(work)보다 먼저 나타나는 유일한 곳은 사전이다.", writersName: "비달 사순"),
    LifeQuote(content: "삶에 진정한 흥미가 있고 호기심이 있는 삶을 살면\n잠이 가장 중요한 것이 아니게 된다는 것을 발견했다.", writersName: "마샤 스튜어트"),
    LifeQuote(content: "성공으로 가는 길과 실패로 가는 길은 거의 똑같다", writersName: "콜린 R. 데이비스"),
    LifeQuote(content: "성공이란 당신 자신, 당신이 하는 일, 그 일을 하는 방식을 좋아하는 것이다.", writersName: "마야 엔젤루"),
    LifeQuote(content: "실패에서부터 성공을 만들어 내라.\n좌절과 실패는 성공으로 가는 가장 확실한 디딤돌이다. ", writersName: "데일 카네기"),
    LifeQuote(content: "당신의 인생을 스스로 설계하지 않으면 다른 사람의 계획에 빠져들 가능성이 크다. 남들이 당신을 위해 계획해 놓은 것? 많지 않다.", writersName: "짐 론"),
    LifeQuote(content: "당신이 정말로 뭔가를 원한다면 기다리지 마라.\n견디지 못하는 법을 스스로에게 가르쳐라.", writersName: "구르박쉬 차할"),
    LifeQuote(content: "패배의 공포가 승리의 짜릿함보다 커지게 하지 마라.", writersName: "로버트 키요사키"),
    LifeQuote(content: "영속적인 변화를 이루고 싶으면 당신의 문제의 크기에 집중하지 말고 당신의 크기에 집중하라!", writersName: "T.하브 에커"),
    LifeQuote(content: "내 경험으로 동기란 단 하나뿐이고, 그건 갈망이다.\n어떤 판단이나 원칙도 그걸 누르거나 저항할 수 없다", writersName: "제인 스마일리"),
    LifeQuote(content: "성공이란 절대 실수를 하지 않는 게 아니라 같은 실수를 두 번 하지 않는 것에 있다.", writersName: "조지버나드 쇼"),
    LifeQuote(content: "위대한 일들을 이루기 전에 스스로에게 위대한 일들을 기대해야 한다.", writersName: "마이클 조던"),
    LifeQuote(content: "동기 부여가 당신을 시작하게 한다.\n습관이 당신을 계속 움직이게 한다.", writersName: "짐 론"),
    LifeQuote(content: "과정에서 재미를 느끼지 못하는데 성공하는 일은 거의 없다", writersName: "데일 카네기"),
    LifeQuote(content: "단호한 마음의 굳은 결심을 막거나 통제할 수 있는 우연, 운명, 숙명이란 없다", writersName: "엘라 휠러 윌콕스"),
    LifeQuote(content: "성만족스럽게 잠자리에 들려면 매일 아침 투지를 가지고 일어나야 한다. ", writersName: "조지 로리머"),
    LifeQuote(content: "성공하려면 당신을 찾아오는 모든 도전을 다 받아들여야 한다.\n마음에 드는 것만 골라 받을 수는 없다. ", writersName: "마이크 가프카"),
    LifeQuote(content: "성공이란 당신 삶의 목적을 깨닫고, 당신의 잠재력을 전부 발휘하고, 남들에게 도움이 되는 씨를 뿌리는 것이다", writersName: "존 C. 맥스웰"),
    LifeQuote(content: "비참해져라. 혹은 스스로에게 동기를 부여하라.\n뭘 해야 하든, 그건 언제나 당신의 선택이다.", writersName: "웨인 다이어"),
    LifeQuote(content: "위대한 것을 이루려면 우리는 행동할 뿐 아니라 꿈도 꾸어야 하고, 계획할 뿐 아니라 믿기도해야 한다.", writersName: "아나톨 프랑스"),
    LifeQuote(content: "세상에서 가장 중요한 일들 대부분은 아무도 도와주지 않을 때에도 계속 노력한 사람들에 의해 이루어졌다.", writersName: "데일 카네기"),
    LifeQuote(content: "성취의 크기는 목표를 이루기 위해 당신이 극복해야 했던 장애물의 크기로 잰다.", writersName: "부커 T. 워싱턴"),
    LifeQuote(content: "진짜 어려움은 극복할 수 있다.\n정복할 수 없는 것은 상상 속의 어려움들뿐이다", writersName: "시어도어N. 베일"),
    LifeQuote(content: "모방해서 성공하는 것보다 독창적으로 실패하는 게 더 낫다.", writersName: "허먼 멜빌"),
    LifeQuote(content: "운은 용기를 내는 사람의 편이다", writersName: "베르길리우스"),
    LifeQuote(content: "소인배는 불운에 길들여지고 눌린다.\n그러나 위대한 사람들은 불운 위로 올라선다.", writersName: "워싱턴 어빙"),
    LifeQuote(content: "실패는 성공을 맛내는 양념이다.", writersName: "트루먼 카포티"),
    LifeQuote(content: "당신이 할 수 없는 일이 할 수 있는 일에 지장을 주게 하지 마라.", writersName: "존 R. 우든"),
    LifeQuote(content: "이기기 위해서는 한 번 이상 전쟁을 치러야 할 때도 있다.", writersName: "마가렛 대처"),
    LifeQuote(content: "인간은 자신이 원하는 만큼 위대해질 수 있다. 자신을 믿고 용기, 투지, 헌신, 경쟁력있는 추진력을 가진다면, 그리고 가치있는 것들을 위한 대가로 작은 것들을 희생할 용의가 있다면 가능하다.", writersName: "빈스 롬바디"),
]
