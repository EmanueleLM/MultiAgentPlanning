(define (domain meeting-with-jessica)
  (:requirements :strips :typing :negative-preconditions)
  (:types time location)

  (:predicates
    (at ?l - location)
    (current ?t - time)
    (next ?t1 ?t2 - time)
    (avail_jessica ?t - time)
    (at_jessica_location)
    (stage0)
    (stage1)
    (stage2)
    (stage3)
    (stage4)
    (stage5)
    (stage6)
  )

  ;; Travel from Haight-Ashbury to Sunset District consumes one 15-minute slot.
  (:action travel_haight_to_sunset
    :parameters (?t ?t2 - time)
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
      (not (at_jessica_location))        ; Jessica is at Haight-Ashbury, so leaving clears this flag
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Travel from Sunset District to Haight-Ashbury consumes one 15-minute slot.
  (:action travel_sunset_to_haight
    :parameters (?t ?t2 - time)
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
      (at_jessica_location)             ; arriving at Haight-Ashbury sets the Jessica co-location flag
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Wait for 15 minutes at current location (consumes one time slot).
  (:action wait15
    :parameters (?t ?t2 - time)
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

  ;; Start the 90-minute (6-slot) continuous meeting with Jessica.
  ;; Requires being at Jessica's location, stage0, and Jessica available at the current slot.
  (:action start_meeting_jessica
    :parameters (?t ?t2 - time)
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

  ;; Continue meeting actions advance the meeting one slot each; k = 1..5
  (:action continue_meeting_jessica_1
    :parameters (?t ?t2 - time)
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
    :parameters (?t ?t2 - time)
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
    :parameters (?t ?t2 - time)
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
    :parameters (?t ?t2 - time)
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
    :parameters (?t ?t2 - time)
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