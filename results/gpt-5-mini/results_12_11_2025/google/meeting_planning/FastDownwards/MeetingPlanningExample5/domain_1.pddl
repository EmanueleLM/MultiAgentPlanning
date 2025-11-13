(define (domain MeetingPlanningExample5)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location tick)

  (:predicates
    (current_time ?t - tick)
    (next ?t1 - tick ?t2 - tick)
    (at ?a - agent ?l - location)
    (travel_stage1 ?from - location ?to - location)
    (travel_stage2 ?from - location ?to - location)
    (travel_done ?from - location ?to - location)
    (can_meet_william ?t - tick)
    (meet1)
    (meet2)
    (meet3)
    (meet4)
    (meet5)
  )

  ;; Begin travel: mark the start of a multi-tick transit (does not advance time)
  (:action begin-travel
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (at ?a ?from) (current_time ?t))
    :effect (and (travel_stage1 ?from ?to) (not (at ?a ?from)))
  )

  ;; Travel step 1: advances time by one tick (first travel tick)
  (:action travel-step-1
    :parameters (?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (travel_stage1 ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (travel_stage2 ?from ?to) (not (travel_stage1 ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Travel step 2: advances time by one tick (second travel tick)
  (:action travel-step-2
    :parameters (?from - location ?to - location ?t1 - tick ?t2 - tick)
    :precondition (and (travel_stage2 ?from ?to) (current_time ?t1) (next ?t1 ?t2))
    :effect (and (travel_done ?from ?to) (not (travel_stage2 ?from ?to)) (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Arrive: finalize travel (does not advance time); places agent at destination
  (:action arrive
    :parameters (?a - agent ?from - location ?to - location ?t - tick)
    :precondition (and (travel_done ?from ?to) (current_time ?t))
    :effect (and (at ?a ?to) (not (travel_done ?from ?to)))
  )

  ;; Wait / advance time by one tick while staying where you are
  (:action advance-time
    :parameters (?t1 - tick ?t2 - tick)
    :precondition (and (current_time ?t1) (next ?t1 ?t2))
    :effect (and (not (current_time ?t1)) (current_time ?t2))
  )

  ;; Meeting actions: each consumes one tick and requires William availability at that tick.
  ;; They are chained: meet2 requires meet1, etc., so five applications (meet1..meet5) produce meet5 goal.

  (:action meet-1
    :parameters (?t1 - tick ?t2 - tick ?a - agent ?loc - location)
    :precondition (and (current_time ?t1) (next ?t1 ?t2) (at ?a ?loc) (can_meet_william ?t1) (not (meet1)))
    :effect (and (meet1) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet-2
    :parameters (?t1 - tick ?t2 - tick ?a - agent ?loc - location)
    :precondition (and (meet1) (current_time ?t1) (next ?t1 ?t2) (at ?a ?loc) (can_meet_william ?t1) (not (meet2)))
    :effect (and (meet2) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet-3
    :parameters (?t1 - tick ?t2 - tick ?a - agent ?loc - location)
    :precondition (and (meet2) (current_time ?t1) (next ?t1 ?t2) (at ?a ?loc) (can_meet_william ?t1) (not (meet3)))
    :effect (and (meet3) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet-4
    :parameters (?t1 - tick ?t2 - tick ?a - agent ?loc - location)
    :precondition (and (meet3) (current_time ?t1) (next ?t1 ?t2) (at ?a ?loc) (can_meet_william ?t1) (not (meet4)))
    :effect (and (meet4) (not (current_time ?t1)) (current_time ?t2))
  )

  (:action meet-5
    :parameters (?t1 - tick ?t2 - tick ?a - agent ?loc - location)
    :precondition (and (meet4) (current_time ?t1) (next ?t1 ?t2) (at ?a ?loc) (can_meet_william ?t1) (not (meet5)))
    :effect (and (meet5) (not (current_time ?t1)) (current_time ?t2))
  )
)