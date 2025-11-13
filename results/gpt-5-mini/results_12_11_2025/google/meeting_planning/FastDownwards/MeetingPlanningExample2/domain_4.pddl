(define (domain meeting-with-jessica)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot location stage)

  (:constants
    haight_ashbury sunset_district - location
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - stage
  )

  (:predicates
    (at ?l - location)
    (current ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (avail_jessica ?t - timeslot)
    (stage ?s - stage)
  )

  (:action travel_haight_to_sunset
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (at haight_ashbury)
      (current ?t)
      (next ?t ?t2)
      (not (stage stage1))
      (not (stage stage2))
      (not (stage stage3))
      (not (stage stage4))
      (not (stage stage5))
    )
    :effect (and
      (not (at haight_ashbury))
      (at sunset_district)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action travel_sunset_to_haight
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (not (stage stage1))
      (not (stage stage2))
      (not (stage stage3))
      (not (stage stage4))
      (not (stage stage5))
    )
    :effect (and
      (not (at sunset_district))
      (at haight_ashbury)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action wait15
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (not (stage stage1))
      (not (stage stage2))
      (not (stage stage3))
      (not (stage stage4))
      (not (stage stage5))
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action start_meeting_jessica
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage stage0)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage stage0))
      (stage stage1)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_1
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage stage1)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage stage1))
      (stage stage2)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_2
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage stage2)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage stage2))
      (stage stage3)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_3
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage stage3)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage stage3))
      (stage stage4)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_4
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage stage4)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage stage4))
      (stage stage5)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_5
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage stage5)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage stage5))
      (stage stage6)
      (not (current ?t))
      (current ?t2)
    )
  )
)