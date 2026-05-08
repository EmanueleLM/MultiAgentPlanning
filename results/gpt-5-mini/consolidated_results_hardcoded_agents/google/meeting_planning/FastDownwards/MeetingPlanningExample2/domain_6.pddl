(define (domain meeting-with-jessica)
  (:requirements :strips :typing :negative-preconditions)
  (:types timeslot location meetingstage)

  (:constants
    haight_ashbury sunset_district - location
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 - meetingstage
  )

  (:predicates
    (at ?l - location)
    (current ?t - timeslot)
    (next ?t1 ?t2 - timeslot)
    (avail_jessica ?t - timeslot)
    (meeting-stage ?m - meetingstage)
  )

  ;; Travel consumes exactly one 15-minute timeslot (next relation) and is only allowed
  ;; when no meeting is in progress (meeting-stage must be stage0).
  (:action travel_haight_to_sunset
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (at haight_ashbury)
      (current ?t)
      (next ?t ?t2)
      (meeting-stage stage0)
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
      (meeting-stage stage0)
    )
    :effect (and
      (not (at sunset_district))
      (at haight_ashbury)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Wait consumes exactly one timeslot and is allowed only when not meeting (stage0).
  (:action wait15
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (meeting-stage stage0)
    )
    :effect (and
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Meeting actions enforce contiguous occupancy: start requires being at the correct location,
  ;; the current timeslot to be within Jessica's availability, and the meeting-stage to be stage0.
  ;; Each action advances the meeting-stage by one and consumes one slot. Continuation actions
  ;; require availability at each slot and that the actor remains at Sunset District.
  (:action start_meeting_jessica
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (meeting-stage stage0)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (meeting-stage stage0))
      (meeting-stage stage1)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_1
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (meeting-stage stage1)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (meeting-stage stage1))
      (meeting-stage stage2)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_2
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (meeting-stage stage2)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (meeting-stage stage2))
      (meeting-stage stage3)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_3
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (meeting-stage stage3)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (meeting-stage stage3))
      (meeting-stage stage4)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_4
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (meeting-stage stage4)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (meeting-stage stage4))
      (meeting-stage stage5)
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action continue_meeting_jessica_5
    :parameters (?t ?t2 - timeslot)
    :precondition (and
      (meeting-stage stage5)
      (at sunset_district)
      (current ?t)
      (next ?t ?t2)
      (avail_jessica ?t)
    )
    :effect (and
      (not (meeting-stage stage5))
      (meeting-stage stage6)
      (not (current ?t))
      (current ?t2)
    )
  )
)