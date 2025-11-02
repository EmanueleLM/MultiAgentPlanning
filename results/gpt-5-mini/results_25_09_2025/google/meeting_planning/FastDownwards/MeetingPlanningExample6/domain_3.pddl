(define (domain meeting-scheduling-classical)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time stage)
  (:predicates
    (visitor-at ?l - location)
    (kenneth-at ?l - location)
    (can-start-meeting ?t - time)
    (met)
    (at-stage ?s - stage)
  )

  (:action travel-visitor-fw-to-nobhill
    :parameters ()
    :precondition (visitor-at fishermanswharf)
    :effect (and
      (not (visitor-at fishermanswharf))
      (visitor-at nobhill)
    )
  )

  (:action travel-visitor-nobhill-to-fw
    :parameters ()
    :precondition (visitor-at nobhill)
    :effect (and
      (not (visitor-at nobhill))
      (visitor-at fishermanswharf)
    )
  )

  (:action start-meeting
    :parameters (?t - time)
    :precondition (and
      (can-start-meeting ?t)
      (not (met))
      (not (at-stage stage90))
    )
    :effect (and
      (at-stage stage90)
      (not (can-start-meeting ?t))
    )
  )

  (:action finish-meeting
    :parameters ()
    :precondition (at-stage stage0)
    :effect (and
      (not (at-stage stage0))
      (met)
    )
  )

  (:action meeting-step-90
    :parameters ()
    :precondition (at-stage stage90)
    :effect (and
      (not (at-stage stage90))
      (at-stage stage89)
    )
  )
  (:action meeting-step-89
    :parameters ()
    :precondition (at-stage stage89)
    :effect (and
      (not (at-stage stage89))
      (at-stage stage88)
    )
  )
  (:action meeting-step-88
    :parameters ()
    :precondition (at-stage stage88)
    :effect (and
      (not (at-stage stage88))
      (at-stage stage87)
    )
  )
  (:action meeting-step-87
    :parameters ()
    :precondition (at-stage stage87)
    :effect (and
      (not (at-stage stage87))
      (at-stage stage86)
    )
  )
  (:action meeting-step-86
    :parameters ()
    :precondition (at-stage stage86)
    :effect (and
      (not (at-stage stage86))
      (at-stage stage85)
    )
  )
  (:action meeting-step-85
    :parameters ()
    :precondition (at-stage stage85)
    :effect (and
      (not (at-stage stage85))
      (at-stage stage84)
    )
  )
  (:action meeting-step-84
    :parameters ()
    :precondition (at-stage stage84)
    :effect (and
      (not (at-stage stage84))
      (at-stage stage83)
    )
  )
  (:action meeting-step-83
    :parameters ()
    :precondition (at-stage stage83)
    :effect (and
      (not (at-stage stage83))
      (at-stage stage82)
    )
  )
  (:action meeting-step-82
    :parameters ()
    :precondition (at-stage stage82)
    :effect (and
      (not (at-stage stage82))
      (at-stage stage81)
    )
  )
  (:action meeting-step-81
    :parameters ()
    :precondition (at-stage stage81)
    :effect (and
      (not (at-stage stage81))
      (at-stage stage80)
    )
  )
  (:action meeting-step-80
    :parameters ()
    :precondition (at-stage stage80)
    :effect (and
      (not (at-stage stage80))
      (at-stage stage79)
    )
  )
  (:action meeting-step-79
    :parameters ()
    :precondition (at-stage stage79)
    :effect (and
      (not (at-stage stage79))
      (at-stage stage78)
    )
  )
  (:action meeting-step-78
    :parameters ()
    :precondition (at-stage stage78)
    :effect (and
      (not (at-stage stage78))
      (at-stage stage77)
    )
  )
  (:action meeting-step-77
    :parameters ()
    :precondition (at-stage stage77)
    :effect (and
      (not (at-stage stage77))
      (at-stage stage76)
    )
  )
  (:action meeting-step-76
    :parameters ()
    :precondition (at-stage stage76)
    :effect (and
      (not (at-stage stage76))
      (at-stage stage75)
    )
  )
  (:action meeting-step-75
    :parameters ()
    :precondition (at-stage stage75)
    :effect (and
      (not (at-stage stage75))
      (at-stage stage74)
    )
  )
  (:action meeting-step-74
    :parameters ()
    :precondition (at-stage stage74)
    :effect (and
      (not (at-stage stage74))
      (at-stage stage73)
    )
  )
  (:action meeting-step-73
    :parameters ()
    :precondition (at-stage stage73)
    :effect (and
      (not (at-stage stage73))
      (at-stage stage72)
    )
  )
  (:action meeting-step-72
    :parameters ()
    :precondition (at-stage stage72)
    :effect (and
      (not (at-stage stage72))
      (at-stage stage71)
    )
  )
  (:action meeting-step-71
    :parameters ()
    :precondition (at-stage stage71)
    :effect (and
      (not (at-stage stage71))
      (at-stage stage70)
    )
  )
  (:action meeting-step-70
    :parameters ()
    :precondition (at-stage stage70)
    :effect (and
      (not (at-stage stage70))
      (at-stage stage69)
    )
  )
  (:action meeting-step-69
    :parameters ()
    :precondition (at-stage stage69)
    :effect (and
      (not (at-stage stage69))
      (at-stage stage68)
    )
  )
  (:action meeting-step-68
    :parameters ()
    :precondition (at-stage stage68)
    :effect (and
      (not (at-stage stage68))
      (at-stage stage67)
    )
  )
  (:action meeting-step-67
    :parameters ()
    :precondition (at-stage stage67)
    :effect (and
      (not (at-stage stage67))
      (at-stage stage66)
    )
  )
  (:action meeting-step-66
    :parameters ()
    :precondition (at-stage stage66)
    :effect (and
      (not (at-stage stage66))
      (at-stage stage65)
    )
  )
  (:action meeting-step-65
    :parameters ()
    :precondition (at-stage stage65)
    :effect (and
      (not (at-stage stage65))
      (at-stage stage64)
    )
  )
  (:action meeting-step-64
    :parameters ()
    :precondition (at-stage stage64)
    :effect (and
      (not (at-stage stage64))
      (at-stage stage63)
    )
  )
  (:action meeting-step-63
    :parameters ()
    :precondition (at-stage stage63)
    :effect (and
      (not (at-stage stage63))
      (at-stage stage62)
    )
  )
  (:action meeting-step-62
    :parameters ()
    :precondition (at-stage stage62)
    :effect (and
      (not (at-stage stage62))
      (at-stage stage61)
    )
  )
  (:action meeting-step-61
    :parameters ()
    :precondition (at-stage stage61)
    :effect (and
      (not (at-stage stage61))
      (at-stage stage60)
    )
  )
  (:action meeting-step-60
    :parameters ()
    :precondition (at-stage stage60)
    :effect (and
      (not (at-stage stage60))
      (at-stage stage59)
    )
  )
  (:action meeting-step-59
    :parameters ()
    :precondition (at-stage stage59)
    :effect (and
      (not (at-stage stage59))
      (at-stage stage58)
    )
  )
  (:action meeting-step-58
    :parameters ()
    :precondition (at-stage stage58)
    :effect (and
      (not (at-stage stage58))
      (at-stage stage57)
    )
  )
  (:action meeting-step-57
    :parameters ()
    :precondition (at-stage stage57)
    :effect (and
      (not (at-stage stage57))
      (at-stage stage56)
    )
  )
  (:action meeting-step-56
    :parameters ()
    :precondition (at-stage stage56)
    :effect (and
      (not (at-stage stage56))
      (at-stage stage55)
    )
  )
  (:action meeting-step-55
    :parameters ()
    :precondition (at-stage stage55)
    :effect (and
      (not (at-stage stage55))
      (at-stage stage54)
    )
  )
  (:action meeting-step-54
    :parameters ()
    :precondition (at-stage stage54)
    :effect (and
      (not (at-stage stage54))
      (at-stage stage53)
    )
  )
  (:action meeting-step-53
    :parameters ()
    :precondition (at-stage stage53)
    :effect (and
      (not (at-stage stage53))
      (at-stage stage52)
    )
  )
  (:action meeting-step-52
    :parameters ()
    :precondition (at-stage stage52)
    :effect (and
      (not (at-stage stage52))
      (at-stage stage51)
    )
  )
  (:action meeting-step-51
    :parameters ()
    :precondition (at-stage stage51)
    :effect (and
      (not (at-stage stage51))
      (at-stage stage50)
    )
  )
  (:action meeting-step-50
    :parameters ()
    :precondition (at-stage stage50)
    :effect (and
      (not (at-stage stage50))
      (at-stage stage49)
    )
  )
  (:action meeting-step-49
    :parameters ()
    :precondition (at-stage stage49)
    :effect (and
      (not (at-stage stage49))
      (at-stage stage48)
    )
  )
  (:action meeting-step-48
    :parameters ()
    :precondition (at-stage stage48)
    :effect (and
      (not (at-stage stage48))
      (at-stage stage47)
    )
  )
  (:action meeting-step-47
    :parameters ()
    :precondition (at-stage stage47)
    :effect (and
      (not (at-stage stage47))
      (at-stage stage46)
    )
  )
  (:action meeting-step-46
    :parameters ()
    :precondition (at-stage stage46)
    :effect (and
      (not (at-stage stage46))
      (at-stage stage45)
    )
  )
  (:action meeting-step-45
    :parameters ()
    :precondition (at-stage stage45)
    :effect (and
      (not (at-stage stage45))
      (at-stage stage44)
    )
  )
  (:action meeting-step-44
    :parameters ()
    :precondition (at-stage stage44)
    :effect (and
      (not (at-stage stage44))
      (at-stage stage43)
    )
  )
  (:action meeting-step-43
    :parameters ()
    :precondition (at-stage stage43)
    :effect (and
      (not (at-stage stage43))
      (at-stage stage42)
    )
  )
  (:action meeting-step-42
    :parameters ()
    :precondition (at-stage stage42)
    :effect (and
      (not (at-stage stage42))
      (at-stage stage41)
    )
  )
  (:action meeting-step-41
    :parameters ()
    :precondition (at-stage stage41)
    :effect (and
      (not (at-stage stage41))
      (at-stage stage40)
    )
  )
  (:action meeting-step-40
    :parameters ()
    :precondition (at-stage stage40)
    :effect (and
      (not (at-stage stage40))
      (at-stage stage39)
    )
  )
  (:action meeting-step-39
    :parameters ()
    :precondition (at-stage stage39)
    :effect (and
      (not (at-stage stage39))
      (at-stage stage38)
    )
  )
  (:action meeting-step-38
    :parameters ()
    :precondition (at-stage stage38)
    :effect (and
      (not (at-stage stage38))
      (at-stage stage37)
    )
  )
  (:action meeting-step-37
    :parameters ()
    :precondition (at-stage stage37)
    :effect (and
      (not (at-stage stage37))
      (at-stage stage36)
    )
  )
  (:action meeting-step-36
    :parameters ()
    :precondition (at-stage stage36)
    :effect (and
      (not (at-stage stage36))
      (at-stage stage35)
    )
  )
  (:action meeting-step-35
    :parameters ()
    :precondition (at-stage stage35)
    :effect (and
      (not (at-stage stage35))
      (at-stage stage34)
    )
  )
  (:action meeting-step-34
    :parameters ()
    :precondition (at-stage stage34)
    :effect (and
      (not (at-stage stage34))
      (at-stage stage33)
    )
  )
  (:action meeting-step-33
    :parameters ()
    :precondition (at-stage stage33)
    :effect (and
      (not (at-stage stage33))
      (at-stage stage32)
    )
  )
  (:action meeting-step-32
    :parameters ()
    :precondition (at-stage stage32)
    :effect (and
      (not (at-stage stage32))
      (at-stage stage31)
    )
  )
  (:action meeting-step-31
    :parameters ()
    :precondition (at-stage stage31)
    :effect (and
      (not (at-stage stage31))
      (at-stage stage30)
    )
  )
  (:action meeting-step-30
    :parameters ()
    :precondition (at-stage stage30)
    :effect (and
      (not (at-stage stage30))
      (at-stage stage29)
    )
  )
  (:action meeting-step-29
    :parameters ()
    :precondition (at-stage stage29)
    :effect (and
      (not (at-stage stage29))
      (at-stage stage28)
    )
  )
  (:action meeting-step-28
    :parameters ()
    :precondition (at-stage stage28)
    :effect (and
      (not (at-stage stage28))
      (at-stage stage27)
    )
  )
  (:action meeting-step-27
    :parameters ()
    :precondition (at-stage stage27)
    :effect (and
      (not (at-stage stage27))
      (at-stage stage26)
    )
  )
  (:action meeting-step-26
    :parameters ()
    :precondition (at-stage stage26)
    :effect (and
      (not (at-stage stage26))
      (at-stage stage25)
    )
  )
  (:action meeting-step-25
    :parameters ()
    :precondition (at-stage stage25)
    :effect (and
      (not (at-stage stage25))
      (at-stage stage24)
    )
  )
  (:action meeting-step-24
    :parameters ()
    :precondition (at-stage stage24)
    :effect (and
      (not (at-stage stage24))
      (at-stage stage23)
    )
  )
  (:action meeting-step-23
    :parameters ()
    :precondition (at-stage stage23)
    :effect (and
      (not (at-stage stage23))
      (at-stage stage22)
    )
  )
  (:action meeting-step-22
    :parameters ()
    :precondition (at-stage stage22)
    :effect (and
      (not (at-stage stage22))
      (at-stage stage21)
    )
  )
  (:action meeting-step-21
    :parameters ()
    :precondition (at-stage stage21)
    :effect (and
      (not (at-stage stage21))
      (at-stage stage20)
    )
  )
  (:action meeting-step-20
    :parameters ()
    :precondition (at-stage stage20)
    :effect (and
      (not (at-stage stage20))
      (at-stage stage19)
    )
  )
  (:action meeting-step-19
    :parameters ()
    :precondition (at-stage stage19)
    :effect (and
      (not (at-stage stage19))
      (at-stage stage18)
    )
  )
  (:action meeting-step-18
    :parameters ()
    :precondition (at-stage stage18)
    :effect (and
      (not (at-stage stage18))
      (at-stage stage17)
    )
  )
  (:action meeting-step-17
    :parameters ()
    :precondition (at-stage stage17)
    :effect (and
      (not (at-stage stage17))
      (at-stage stage16)
    )
  )
  (:action meeting-step-16
    :parameters ()
    :precondition (at-stage stage16)
    :effect (and
      (not (at-stage stage16))
      (at-stage stage15)
    )
  )
  (:action meeting-step-15
    :parameters ()
    :precondition (at-stage stage15)
    :effect (and
      (not (at-stage stage15))
      (at-stage stage14)
    )
  )
  (:action meeting-step-14
    :parameters ()
    :precondition (at-stage stage14)
    :effect (and
      (not (at-stage stage14))
      (at-stage stage13)
    )
  )
  (:action meeting-step-13
    :parameters ()
    :precondition (at-stage stage13)
    :effect (and
      (not (at-stage stage13))
      (at-stage stage12)
    )
  )
  (:action meeting-step-12
    :parameters ()
    :precondition (at-stage stage12)
    :effect (and
      (not (at-stage stage12))
      (at-stage stage11)
    )
  )
  (:action meeting-step-11
    :parameters ()
    :precondition (at-stage stage11)
    :effect (and
      (not (at-stage stage11))
      (at-stage stage10)
    )
  )
  (:action meeting-step-10
    :parameters ()
    :precondition (at-stage stage10)
    :effect (and
      (not (at-stage stage10))
      (at-stage stage9)
    )
  )
  (:action meeting-step-9
    :parameters ()
    :precondition (at-stage stage9)
    :effect (and
      (not (at-stage stage9))
      (at-stage stage8)
    )
  )
  (:action meeting-step-8
    :parameters ()
    :precondition (at-stage stage8)
    :effect (and
      (not (at-stage stage8))
      (at-stage stage7)
    )
  )
  (:action meeting-step-7
    :parameters ()
    :precondition (at-stage stage7)
    :effect (and
      (not (at-stage stage7))
      (at-stage stage6)
    )
  )
  (:action meeting-step-6
    :parameters ()
    :precondition (at-stage stage6)
    :effect (and
      (not (at-stage stage6))
      (at-stage stage5)
    )
  )
  (:action meeting-step-5
    :parameters ()
    :precondition (at-stage stage5)
    :effect (and
      (not (at-stage stage5))
      (at-stage stage4)
    )
  )
  (:action meeting-step-4
    :parameters ()
    :precondition (at-stage stage4)
    :effect (and
      (not (at-stage stage4))
      (at-stage stage3)
    )
  )
  (:action meeting-step-3
    :parameters ()
    :precondition (at-stage stage3)
    :effect (and
      (not (at-stage stage3))
      (at-stage stage2)
    )
  )
  (:action meeting-step-2
    :parameters ()
    :precondition (at-stage stage2)
    :effect (and
      (not (at-stage stage2))
      (at-stage stage1)
    )
  )
  (:action meeting-step-1
    :parameters ()
    :precondition (at-stage stage1)
    :effect (and
      (not (at-stage stage1))
      (at-stage stage0)
    )
  )
)