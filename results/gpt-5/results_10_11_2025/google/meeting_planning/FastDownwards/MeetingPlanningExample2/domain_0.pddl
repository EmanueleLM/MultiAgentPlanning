(define (domain meeting-sf)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    location timeslot
  )
  (:constants
    haight-ashbury sunset-district - location
  )
  (:predicates
    (at ?l - location)
    (current ?t - timeslot)
    (next ?t - timeslot ?t2 - timeslot)
    (avail_jessica ?t - timeslot)
    (at_jessica_location)
    (stage0) (stage1) (stage2) (stage3) (stage4) (stage5) (stage6)
  )

  (:action travel_haight_to_sunset
    :parameters (?t - timeslot ?t2 - timeslot)
    :precondition (and
      (stage0)
      (at haight-ashbury)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at haight-ashbury))
      (at sunset-district)
      (not (current ?t))
      (current ?t2)
      (at_jessica_location)
    )
  )

  (:action travel_sunset_to_haight
    :parameters (?t - timeslot ?t2 - timeslot)
    :precondition (and
      (stage0)
      (at sunset-district)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (at sunset-district))
      (at haight-ashbury)
      (not (current ?t))
      (current ?t2)
      (not (at_jessica_location))
    )
  )

  (:action wait15
    :parameters (?t - timeslot ?t2 - timeslot)
    :precondition (and
      (stage0)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action start_meeting_jessica
    :parameters (?t - timeslot ?t2 - timeslot)
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
    :parameters (?t - timeslot ?t2 - timeslot)
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
    :parameters (?t - timeslot ?t2 - timeslot)
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
    :parameters (?t - timeslot ?t2 - timeslot)
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
    :parameters (?t - timeslot ?t2 - timeslot)
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
    :parameters (?t - timeslot ?t2 - timeslot)
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