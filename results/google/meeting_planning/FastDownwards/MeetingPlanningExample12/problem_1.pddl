(define (problem MeetingPlanningExample12)
  (:domain MeetingPlanningExample12-domain)
  (:objects
    NorthBeach AlamoSquare - location
    self - agent
    barbara - friend
  )
  (:init
    ; Time origin 0 corresponds to 09:00.
    (at-agent self NorthBeach)
    ; Barbara is not initially available or located anywhere until her availability window opens.
  )

  ; Timed initial literals encode Barbara's availability at Alamo Square:
  ; 18:00 = 540 minutes after 09:00; 21:30 = 750 minutes after 09:00.
  (at 540 (barbara-available))
  (at 540 (at-friend barbara AlamoSquare))
  (at 750 (not (barbara-available)))
  (at 750 (not (at-friend barbara AlamoSquare)))

  (:goal
    (and
      (met-barbara-90)
    )
  )
)