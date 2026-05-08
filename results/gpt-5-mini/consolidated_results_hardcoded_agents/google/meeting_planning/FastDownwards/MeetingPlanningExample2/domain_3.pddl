(define (domain meeting-with-jessica)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot location)

  (:constants
    haight_ashbury sunset_district - location
  )

  (:predicates
    (at ?l - location)
    (current ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (avail_jessica ?t - timeslot)
    (at_jessica_location)
    (stage0)
    (stage1)
    (stage2)
    (stage3)
    (stage4)
    (stage5)
    (stage6)
  )

  (:action travel_haight_to_sunset
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (at haight_ashbury)
      (current ?t)
      (next ?t ?t2)
      (not (stage1))
      (not (stage2))
      (not (stage3))
      (not (stage4))
      (not (stage5))
    )
    :effect (and
      (not (at haight_ashbury))
      (at sunset_district)
      (at_jessica_location)
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
      (not (stage1))
      (not (stage2))
      (not (stage3))
      (not (stage4))
      (not (stage5))
    )
    :effect (and
      (not (at sunset_district))
      (at haight_ashbury)
      (not (at_jessica_location))
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action wait15
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (not (stage1))
      (not (stage2))
      (not (stage3))
      (not (stage4))
      (not (stage5))
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action start_meeting_jessica
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage0)
      (at_jessica_location)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage0))
      (stage1)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_1
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage1)
      (at_jessica_location)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage1))
      (stage2)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_2
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage2)
      (at_jessica_location)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage2))
      (stage3)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_3
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage3)
      (at_jessica_location)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage3))
      (stage4)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_4
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage4)
      (at_jessica_location)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage4))
      (stage5)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_5
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (stage5)
      (at_jessica_location)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (stage5))
      (stage6)
      (not (current ?t))
      (current ?t2)
    )
  )
)