(define (domain MeetingPlanningExample5)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tick)

  (:predicates
    ;; time progression
    (current_time ?t - tick)
    (next ?t1 - tick ?t2 - tick)

    ;; location of agent
    (at ?a - agent ?l - location)

    ;; William location and availability per tick
    (william_here ?l - location)
    (can_meet_william ?t - tick)

    ;; travel staged predicates for 2-tick travel per route
    (in_travel_stage1 ?a - agent ?from - location ?to - location)
    (in_travel_stage2 ?a - agent ?from - location ?to - location)
    (travel_done ?a - agent ?from - location ?to - location)

    ;; meeting staged predicates to enforce contiguous meeting ticks
    (meeting_stage1 ?a - agent ?l - location)
    (meeting_stage2 ?a - agent ?l - location)
    (meeting_stage3 ?a - agent ?l - location)
    (meeting_stage4 ?a - agent ?l - location)
    (meeting_stage5 ?a - agent ?l - location)

    ;; global engaged flag to prevent time advancement or overlapping actions while traveling/meeting
    (engaged)

    ;; goal marker: completed five contiguous meeting ticks with William
    (met_william5)
  )

  ;; Begin a 2-tick travel: mark travel stage 1, remove being at origin, set engaged.
  (:action begin-travel
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (at ?a ?from) (current_time ?t) (not (engaged)))
    :effect (and (in_travel_stage1 ?a ?from ?to) (not (at ?a ?from)) (engaged))
  )

  ;; Travel first tick: advance time by one tick and progress to travel stage 2.
  (:action travel-step-1
    :parameters (?a - agent ?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (in_travel_stage1 ?a ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (in_travel_stage2 ?a ?from ?to) (not (in_travel_stage1 ?a ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Travel second tick: advance time by one tick and mark travel done.
  (:action travel-step-2
    :parameters (?a - agent ?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (in_travel_stage2 ?a ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (travel_done ?a ?from ?to) (not (in_travel_stage2 ?a ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Arrive at destination: finalize travel, set location, clear travel and engaged.
  (:action arrive
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (travel_done ?a ?from ?to) (current_time ?t))
    :effect (and (at ?a ?to) (not (travel_done ?a ?from ?to)) (not (engaged)))
  )

  ;; Advance time by one tick when not engaged in travel or meeting.
  (:action advance-time
    :parameters (?t1 - tick ?t2 - tick)
    :precondition (and (current_time ?t1) (next ?t1 ?t2) (not (engaged)))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Begin meeting: must be at location where William is present and available now; set meeting stage 1 and engaged.
  (:action begin-meeting
    :parameters (?a - agent ?l - location ?t - tick)
    :precondition (and (at ?a ?l) (william_here ?l) (current_time ?t) (can_meet_william ?t) (not (engaged)))
    :effect (and (meeting_stage1 ?a ?l) (not (at ?a ?l)) (engaged))
  )

  ;; Meeting step 1: consume one tick, require William available at current tick, progress to next stage.
  (:action meeting-step-1
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage1 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage2 ?a ?l) (not (meeting_stage1 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Meeting step 2
  (:action meeting-step-2
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage2 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage3 ?a ?l) (not (meeting_stage2 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Meeting step 3
  (:action meeting-step-3
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage3 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage4 ?a ?l) (not (meeting_stage3 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Meeting step 4
  (:action meeting-step-4
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage4 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (meeting_stage5 ?a ?l) (not (meeting_stage4 ?a ?l)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Meeting step 5 (fifth contiguous meeting tick): finalize meeting, set goal marker, clear engaged, and restore at-location.
  (:action meeting-step-5
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage5 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (met_william5) (not (meeting_stage5 ?a ?l)) (not (current_time ?t1)) (current_time ?t2) (at ?a ?l) (not (engaged)))
  )
)