(define (domain meeting-scheduling-classical)
  (:requirements :strips :typing :negative-preconditions :fluents :action-costs)
  (:types agent location time stage)
  (:predicates
    (visitor-at ?l - location)
    (kenneth-at ?l - location)
    (can_start_meeting ?t - time)
    (met)
    (stage ?s - stage)
  )
  (:functions (total-cost))

  (:action travel-visitor-fw-to-nobhill
    :parameters ()
    :precondition (visitor-at fishermanswharf)
    :effect (and
      (not (visitor-at fishermanswharf))
      (visitor-at nobhill)
      (increase (total-cost) 11)
    )
  )

  (:action travel-visitor-nobhill-to-fw
    :parameters ()
    :precondition (visitor-at nobhill)
    :effect (and
      (not (visitor-at nobhill))
      (visitor-at fishermanswharf)
      (increase (total-cost) 11)
    )
  )

  (:action start-meeting
    :parameters (?t - time)
    :precondition (and
      (can_start_meeting ?t)
      (not (met))
      (not (stage stage90))
    )
    :effect (and
      (stage stage90)
      (not (can_start_meeting ?t))
    )
  )

  (:action finish-meeting
    :parameters ()
    :precondition (stage stage0)
    :effect (and
      (not (stage stage0))
      (met)
    )
  )

  (:action meeting-step-90
    :parameters ()
    :precondition (stage stage90)
    :effect (and
      (not (stage stage90))
      (stage stage89)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-89
    :parameters ()
    :precondition (stage stage89)
    :effect (and
      (not (stage stage89))
      (stage stage88)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-88
    :parameters ()
    :precondition (stage stage88)
    :effect (and
      (not (stage stage88))
      (stage stage87)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-87
    :parameters ()
    :precondition (stage stage87)
    :effect (and
      (not (stage stage87))
      (stage stage86)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-86
    :parameters ()
    :precondition (stage stage86)
    :effect (and
      (not (stage stage86))
      (stage stage85)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-85
    :parameters ()
    :precondition (stage stage85)
    :effect (and
      (not (stage stage85))
      (stage stage84)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-84
    :parameters ()
    :precondition (stage stage84)
    :effect (and
      (not (stage stage84))
      (stage stage83)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-83
    :parameters ()
    :precondition (stage stage83)
    :effect (and
      (not (stage stage83))
      (stage stage82)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-82
    :parameters ()
    :precondition (stage stage82)
    :effect (and
      (not (stage stage82))
      (stage stage81)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-81
    :parameters ()
    :precondition (stage stage81)
    :effect (and
      (not (stage stage81))
      (stage stage80)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-80
    :parameters ()
    :precondition (stage stage80)
    :effect (and
      (not (stage stage80))
      (stage stage79)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-79
    :parameters ()
    :precondition (stage stage79)
    :effect (and
      (not (stage stage79))
      (stage stage78)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-78
    :parameters ()
    :precondition (stage stage78)
    :effect (and
      (not (stage stage78))
      (stage stage77)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-77
    :parameters ()
    :precondition (stage stage77)
    :effect (and
      (not (stage stage77))
      (stage stage76)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-76
    :parameters ()
    :precondition (stage stage76)
    :effect (and
      (not (stage stage76))
      (stage stage75)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-75
    :parameters ()
    :precondition (stage stage75)
    :effect (and
      (not (stage stage75))
      (stage stage74)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-74
    :parameters ()
    :precondition (stage stage74)
    :effect (and
      (not (stage stage74))
      (stage stage73)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-73
    :parameters ()
    :precondition (stage stage73)
    :effect (and
      (not (stage stage73))
      (stage stage72)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-72
    :parameters ()
    :precondition (stage stage72)
    :effect (and
      (not (stage stage72))
      (stage stage71)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-71
    :parameters ()
    :precondition (stage stage71)
    :effect (and
      (not (stage stage71))
      (stage stage70)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-70
    :parameters ()
    :precondition (stage stage70)
    :effect (and
      (not (stage stage70))
      (stage stage69)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-69
    :parameters ()
    :precondition (stage stage69)
    :effect (and
      (not (stage stage69))
      (stage stage68)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-68
    :parameters ()
    :precondition (stage stage68)
    :effect (and
      (not (stage stage68))
      (stage stage67)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-67
    :parameters ()
    :precondition (stage stage67)
    :effect (and
      (not (stage stage67))
      (stage stage66)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-66
    :parameters ()
    :precondition (stage stage66)
    :effect (and
      (not (stage stage66))
      (stage stage65)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-65
    :parameters ()
    :precondition (stage stage65)
    :effect (and
      (not (stage stage65))
      (stage stage64)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-64
    :parameters ()
    :precondition (stage stage64)
    :effect (and
      (not (stage stage64))
      (stage stage63)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-63
    :parameters ()
    :precondition (stage stage63)
    :effect (and
      (not (stage stage63))
      (stage stage62)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-62
    :parameters ()
    :precondition (stage stage62)
    :effect (and
      (not (stage stage62))
      (stage stage61)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-61
    :parameters ()
    :precondition (stage stage61)
    :effect (and
      (not (stage stage61))
      (stage stage60)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-60
    :parameters ()
    :precondition (stage stage60)
    :effect (and
      (not (stage stage60))
      (stage stage59)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-59
    :parameters ()
    :precondition (stage stage59)
    :effect (and
      (not (stage stage59))
      (stage stage58)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-58
    :parameters ()
    :precondition (stage stage58)
    :effect (and
      (not (stage stage58))
      (stage stage57)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-57
    :parameters ()
    :precondition (stage stage57)
    :effect (and
      (not (stage stage57))
      (stage stage56)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-56
    :parameters ()
    :precondition (stage stage56)
    :effect (and
      (not (stage stage56))
      (stage stage55)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-55
    :parameters ()
    :precondition (stage stage55)
    :effect (and
      (not (stage stage55))
      (stage stage54)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-54
    :parameters ()
    :precondition (stage stage54)
    :effect (and
      (not (stage stage54))
      (stage stage53)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-53
    :parameters ()
    :precondition (stage stage53)
    :effect (and
      (not (stage stage53))
      (stage stage52)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-52
    :parameters ()
    :precondition (stage stage52)
    :effect (and
      (not (stage stage52))
      (stage stage51)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-51
    :parameters ()
    :precondition (stage stage51)
    :effect (and
      (not (stage stage51))
      (stage stage50)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-50
    :parameters ()
    :precondition (stage stage50)
    :effect (and
      (not (stage stage50))
      (stage stage49)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-49
    :parameters ()
    :precondition (stage stage49)
    :effect (and
      (not (stage stage49))
      (stage stage48)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-48
    :parameters ()
    :precondition (stage stage48)
    :effect (and
      (not (stage stage48))
      (stage stage47)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-47
    :parameters ()
    :precondition (stage stage47)
    :effect (and
      (not (stage stage47))
      (stage stage46)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-46
    :parameters ()
    :precondition (stage stage46)
    :effect (and
      (not (stage stage46))
      (stage stage45)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-45
    :parameters ()
    :precondition (stage stage45)
    :effect (and
      (not (stage stage45))
      (stage stage44)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-44
    :parameters ()
    :precondition (stage stage44)
    :effect (and
      (not (stage stage44))
      (stage stage43)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-43
    :parameters ()
    :precondition (stage stage43)
    :effect (and
      (not (stage stage43))
      (stage stage42)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-42
    :parameters ()
    :precondition (stage stage42)
    :effect (and
      (not (stage stage42))
      (stage stage41)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-41
    :parameters ()
    :precondition (stage stage41)
    :effect (and
      (not (stage stage41))
      (stage stage40)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-40
    :parameters ()
    :precondition (stage stage40)
    :effect (and
      (not (stage stage40))
      (stage stage39)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-39
    :parameters ()
    :precondition (stage stage39)
    :effect (and
      (not (stage stage39))
      (stage stage38)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-38
    :parameters ()
    :precondition (stage stage38)
    :effect (and
      (not (stage stage38))
      (stage stage37)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-37
    :parameters ()
    :precondition (stage stage37)
    :effect (and
      (not (stage stage37))
      (stage stage36)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-36
    :parameters ()
    :precondition (stage stage36)
    :effect (and
      (not (stage stage36))
      (stage stage35)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-35
    :parameters ()
    :precondition (stage stage35)
    :effect (and
      (not (stage stage35))
      (stage stage34)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-34
    :parameters ()
    :precondition (stage stage34)
    :effect (and
      (not (stage stage34))
      (stage stage33)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-33
    :parameters ()
    :precondition (stage stage33)
    :effect (and
      (not (stage stage33))
      (stage stage32)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-32
    :parameters ()
    :precondition (stage stage32)
    :effect (and
      (not (stage stage32))
      (stage stage31)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-31
    :parameters ()
    :precondition (stage stage31)
    :effect (and
      (not (stage stage31))
      (stage stage30)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-30
    :parameters ()
    :precondition (stage stage30)
    :effect (and
      (not (stage stage30))
      (stage stage29)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-29
    :parameters ()
    :precondition (stage stage29)
    :effect (and
      (not (stage stage29))
      (stage stage28)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-28
    :parameters ()
    :precondition (stage stage28)
    :effect (and
      (not (stage stage28))
      (stage stage27)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-27
    :parameters ()
    :precondition (stage stage27)
    :effect (and
      (not (stage stage27))
      (stage stage26)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-26
    :parameters ()
    :precondition (stage stage26)
    :effect (and
      (not (stage stage26))
      (stage stage25)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-25
    :parameters ()
    :precondition (stage stage25)
    :effect (and
      (not (stage stage25))
      (stage stage24)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-24
    :parameters ()
    :precondition (stage stage24)
    :effect (and
      (not (stage stage24))
      (stage stage23)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-23
    :parameters ()
    :precondition (stage stage23)
    :effect (and
      (not (stage stage23))
      (stage stage22)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-22
    :parameters ()
    :precondition (stage stage22)
    :effect (and
      (not (stage stage22))
      (stage stage21)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-21
    :parameters ()
    :precondition (stage stage21)
    :effect (and
      (not (stage stage21))
      (stage stage20)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-20
    :parameters ()
    :precondition (stage stage20)
    :effect (and
      (not (stage stage20))
      (stage stage19)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-19
    :parameters ()
    :precondition (stage stage19)
    :effect (and
      (not (stage stage19))
      (stage stage18)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-18
    :parameters ()
    :precondition (stage stage18)
    :effect (and
      (not (stage stage18))
      (stage stage17)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-17
    :parameters ()
    :precondition (stage stage17)
    :effect (and
      (not (stage stage17))
      (stage stage16)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-16
    :parameters ()
    :precondition (stage stage16)
    :effect (and
      (not (stage stage16))
      (stage stage15)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-15
    :parameters ()
    :precondition (stage stage15)
    :effect (and
      (not (stage stage15))
      (stage stage14)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-14
    :parameters ()
    :precondition (stage stage14)
    :effect (and
      (not (stage stage14))
      (stage stage13)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-13
    :parameters ()
    :precondition (stage stage13)
    :effect (and
      (not (stage stage13))
      (stage stage12)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-12
    :parameters ()
    :precondition (stage stage12)
    :effect (and
      (not (stage stage12))
      (stage stage11)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-11
    :parameters ()
    :precondition (stage stage11)
    :effect (and
      (not (stage stage11))
      (stage stage10)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-10
    :parameters ()
    :precondition (stage stage10)
    :effect (and
      (not (stage stage10))
      (stage stage9)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-9
    :parameters ()
    :precondition (stage stage9)
    :effect (and
      (not (stage stage9))
      (stage stage8)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-8
    :parameters ()
    :precondition (stage stage8)
    :effect (and
      (not (stage stage8))
      (stage stage7)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-7
    :parameters ()
    :precondition (stage stage7)
    :effect (and
      (not (stage stage7))
      (stage stage6)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-6
    :parameters ()
    :precondition (stage stage6)
    :effect (and
      (not (stage stage6))
      (stage stage5)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-5
    :parameters ()
    :precondition (stage stage5)
    :effect (and
      (not (stage stage5))
      (stage stage4)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-4
    :parameters ()
    :precondition (stage stage4)
    :effect (and
      (not (stage stage4))
      (stage stage3)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-3
    :parameters ()
    :precondition (stage stage3)
    :effect (and
      (not (stage stage3))
      (stage stage2)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-2
    :parameters ()
    :precondition (stage stage2)
    :effect (and
      (not (stage stage2))
      (stage stage1)
      (increase (total-cost) 1)
    )
  )
  (:action meeting-step-1
    :parameters ()
    :precondition (stage stage1)
    :effect (and
      (not (stage stage1))
      (stage stage0)
      (increase (total-cost) 1)
    )
  )
)