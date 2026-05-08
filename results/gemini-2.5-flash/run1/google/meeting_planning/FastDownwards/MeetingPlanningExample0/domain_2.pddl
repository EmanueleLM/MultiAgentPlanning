(define (domain meeting-planning-strips)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types agent location time-point)
  (:predicates
    (at ?a - agent ?l - location)
    (meeting-happened ?traveler - agent ?friend - agent)
    (at-time ?t - time-point) ; Indicates the current time
    
    ;; Precomputed predicates for time and duration constraints
    (is-20-minutes-after ?t1 - time-point ?t2 - time-point)
    (duration-ge-120 ?t1 - time-point ?t2 - time-point)
    (is-available-throughout ?friend - agent ?loc - location ?t-start - time-point ?t-end - time-point)
  )
  (:functions (total-cost))

  ;; Action for moving between locations
  ;; This action is instantaneous but represents a duration by advancing time from ?t-start to ?t-end
  (action move
    :parameters (?ag - agent ?from - location ?to - location ?t-start - time-point ?t-end - time-point)
    :precondition (and (at ?ag ?from)
                       (at-time ?t-start)
                       (is-20-minutes-after ?t-start ?t-end)
                       (not (= ?from ?to)))
    :effect (and (not (at ?ag ?from))
                 (at ?ag ?to)
                 (not (at-time ?t-start))
                 (at-time ?t-end)
                 (increase (total-cost) 1))
  )

  ;; Action for conducting a meeting
  ;; This action is instantaneous but represents a continuous duration by checking time window and availability
  (action conduct-meeting
    :parameters (?traveler - agent ?friend - agent ?loc - location ?t-start - time-point ?t-end - time-point)
    :precondition (and (at ?traveler ?loc)
                       (at-time ?t-start)
                       (duration-ge-120 ?t-start ?t-end)
                       (is-available-throughout ?friend ?loc ?t-start ?t-end)
                       (not (meeting-happened ?traveler ?friend))) ; Ensure meeting only happens once
    :effect (and (meeting-happened ?traveler ?friend)
                 (not (at-time ?t-start))
                 (at-time ?t-end))
  )
)