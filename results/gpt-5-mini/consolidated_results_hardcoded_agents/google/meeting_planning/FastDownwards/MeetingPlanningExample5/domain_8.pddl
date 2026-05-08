(define (domain MeetingPlanningExample5)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tick)

  (:predicates
    (current_time ?t - tick)
    (next ?t1 - tick ?t2 - tick)

    (at ?a - agent ?l - location)

    (william_here ?l - location)
    (can_meet_william ?t - tick)

    (route2 ?from - location ?to - location)

    ;; Travel staged predicates enforce contiguous 2-tick travel
    (in_travel_stage1 ?a - agent ?from - location ?to - location)
    (in_travel_stage2 ?a - agent ?from - location ?to - location)
    (travel_done ?a - agent ?from - location ?to - location)

    ;; Meeting staged predicates enforce contiguous 5-tick meeting
    (meeting_stage1 ?a - agent ?l - location)
    (meeting_stage2 ?a - agent ?l - location)
    (meeting_stage3 ?a - agent ?l - location)
    (meeting_stage4 ?a - agent ?l - location)
    (meeting_stage5 ?a - agent ?l - location)

    ;; Engagement marker prevents interleaving/advance while traveling or meeting
    (engaged)

    ;; Goal marker: achieved only by completing five contiguous meeting ticks
    (met_william5)
  )

  ;; Begin travel: must be at origin at current time, valid route, and not engaged.
  ;; Immediately removes presence at origin and marks first travel stage and engaged.
  (:action begin-travel
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (at ?a ?from) (current_time ?t) (route2 ?from ?to) (not (engaged)))
    :effect (and (in_travel_stage1 ?a ?from ?to) (not (at ?a ?from)) (engaged))
  )

  ;; Travel consumes one tick per step, requiring contiguous ticks via next relation.
  (:action travel-step-1
    :parameters (?a - agent ?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (in_travel_stage1 ?a ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (in_travel_stage2 ?a ?from ?to) (not (in_travel_stage1 ?a ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action travel-step-2
    :parameters (?a - agent ?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (in_travel_stage2 ?a ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (travel_done ?a ?from ?to) (not (in_travel_stage2 ?a ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Arrival finalizes travel in the same tick resulted from travel-step-2.
  (:action arrive
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (travel_done ?a ?from ?to) (current_time ?t))
    :effect (and (at ?a ?to) (not (travel_done ?a ?from ?to)) (not (engaged)))
  )

  ;; Advance time only allowed when not engaged (i.e., not in middle of travel or meeting).
  (:action advance-time
    :parameters (?t1 - tick ?t2 - tick)
    :precondition (and (current_time ?t1) (next ?t1 ?t2) (not (engaged)))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Begin meeting: must be at William's location, William present there, current tick within availability, and not engaged.
  (:action begin-meeting
    :parameters (?a - agent ?l - location ?t - tick)
    :precondition (and (at ?a ?l) (william_here ?l) (current_time ?t) (can_meet_william ?t) (not (engaged)))
    :effect (and (meeting_stage1 ?a ?l) (engaged))
  )

  ;; Each meeting-step consumes one tick and requires William's availability at the tick being consumed.
  (:action meeting-step-1
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage1 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage2 ?a ?l) (not (meeting_stage1 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meeting-step-2
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage2 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage3 ?a ?l) (not (meeting_stage2 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meeting-step-3
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage3 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage4 ?a ?l) (not (meeting_stage3 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meeting-step-4
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage4 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage5 ?a ?l) (not (meeting_stage4 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Final meeting step completes 5 contiguous meeting ticks (5 * 15 = 75 minutes) and clears engaged.
  (:action meeting-step-5
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage5 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (met_william5) (not (meeting_stage5 ?a ?l)) (not (current_time ?t1)) (current_time ?t2) (not (engaged)))
  )
)