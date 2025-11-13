(define (domain MeetingPlanningExample5)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tick)

  (:predicates
    ;; time progression
    (current_time ?t - tick)
    (next ?t1 - tick ?t2 - tick)

    ;; location
    (at ?a - agent ?l - location)

    ;; travel staged predicates tied to an agent and route
    (in_travel_stage1 ?a - agent ?from - location ?to - location)
    (in_travel_stage2 ?a - agent ?from - location ?to - location)
    (travel_done ?a - agent ?from - location ?to - location)

    ;; William location marker (used to require meetings only at that location)
    (william_here ?l - location)

    ;; tick-level availability for William (meeting may start on ticks where this holds)
    (can_meet_william ?t - tick)

    ;; meeting staged predicates tied to an agent and location to enforce contiguous meeting ticks
    (meeting_stage1 ?a - agent ?l - location)
    (meeting_stage2 ?a - agent ?l - location)
    (meeting_stage3 ?a - agent ?l - location)
    (meeting_stage4 ?a - agent ?l - location)

    ;; goal marker: completed five contiguous meeting ticks with William
    (met_william5)
  )

  ;; Begin travel: start a 2-tick travel from ?from to ?to for agent ?a.
  (:action begin-travel
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (at ?a ?from) (current_time ?t) (not (meeting_stage1 ?a ?from)) (not (meeting_stage2 ?a ?from)))
    :effect (and (in_travel_stage1 ?a ?from ?to) (not (at ?a ?from)))
  )

  ;; Travel first tick: consumes one tick, moves to next travel stage
  (:action travel-step-1
    :parameters (?a - agent ?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (in_travel_stage1 ?a ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (in_travel_stage2 ?a ?from ?to) (not (in_travel_stage1 ?a ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Travel second tick: consumes one tick and marks travel done
  (:action travel-step-2
    :parameters (?a - agent ?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (in_travel_stage2 ?a ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (travel_done ?a ?from ?to) (not (in_travel_stage2 ?a ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Arrive: finalize travel at destination (does not advance time)
  (:action arrive
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (travel_done ?a ?from ?to) (current_time ?t))
    :effect (and (at ?a ?to) (not (travel_done ?a ?from ?to)))
  )

  ;; Advance time by one tick while staying put (used when not traveling or meeting)
  (:action advance-time
    :parameters (?t1 - tick ?t2 - tick)
    :precondition (and (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Begin meeting: must be at a location where William is present and William available at this tick.
  ;; This removes the plain at predicate to prevent overlapping travel or other actions during meeting.
  (:action begin-meeting
    :parameters (?a - agent ?l - location ?t - tick)
    :precondition (and (at ?a ?l) (william_here ?l) (current_time ?t) (can_meet_william ?t) (not (in_travel_stage1 ?a ?l ?l)) )
    :effect (and (meeting_stage1 ?a ?l) (not (at ?a ?l)))
  )

  ;; Meeting step 1: consumes one tick, requires William available at that tick, continues meeting.
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

  ;; Meeting step 4 (fourth tick)
  (:action meeting-step-4
    :parameters (?a - agent ?l - location ?t1 - tick ?t2 - tick)
    :precondition (and (meeting_stage4 ?a ?l) (current_time ?t1) (next ?t1 ?t2) (can_meet_william ?t1) (william_here ?l))
    :effect (and (met_william5) (not (meeting_stage4 ?a ?l)) (not (current_time ?t1)) (current_time ?t2) (at ?a ?l))
  )
)