(define (domain meeting-orchestrator)
  (:requirements :strips :typing :fluents :negative-preconditions :equality)
  (:types agent location)

  ;; Predicates
  (:predicates
    (at ?a - agent ?l - location)
    (meeting-done)
  )

  ;; Numeric functions (fluents)
  ;; time                -- global clock
  ;; visitor-travel      -- cumulative travel cost/time of the visitor agent (objective)
  ;; meeting-duration    -- required meeting length
  ;; avail-start ?a      -- earliest time agent ?a can attend
  ;; avail-end ?a        -- latest time agent ?a can attend
  ;; travel-time ?a ?from ?to -- travel time for agent ?a between locations
  (:functions
    (time)
    (visitor-travel)
    (meeting-duration)
    (avail-start ?a - agent)
    (avail-end ?a - agent)
    (travel-time ?a - agent ?from - location ?to - location)
  )

  ;; Travel action for agent a1 (namespaced)
  (:action travel-a1
    :parameters (?from - location ?to - location)
    :precondition (and (at a1 ?from))
    :effect (and
      (not (at a1 ?from))
      (at a1 ?to)
      (increase (time) (travel-time a1 ?from ?to))
      ;; accumulate visitor travel if a1 is the visitor in this template
      (increase (visitor-travel) (travel-time a1 ?from ?to))
    )
  )

  ;; Travel action for agent a2 (namespaced)
  (:action travel-a2
    :parameters (?from - location ?to - location)
    :precondition (and (at a2 ?from))
    :effect (and
      (not (at a2 ?from))
      (at a2 ?to)
      (increase (time) (travel-time a2 ?from ?to))
    )
  )

  ;; Wait actions (namespaced) that advance the global time by 1 unit.
  ;; The planner may apply multiple waits to reach avail windows.
  (:action wait-a1
    :parameters ()
    :precondition ()
    :effect (increase (time) 1)
  )

  (:action wait-a2
    :parameters ()
    :precondition ()
    :effect (increase (time) 1)
  )

  ;; Start and conduct meeting (orchestrator-coordinated)
  ;; Preconditions:
  ;;  - both agents are at the same location
  ;;  - current time >= both agents' avail-start
  ;;  - current time + meeting-duration <= both agents' avail-end
  ;; Effect:
  ;;  - time advances by meeting-duration
  ;;  - mark meeting done
  (:action orchestrator_start_meeting
    :parameters (?loc - location)
    :precondition (and
      (at a1 ?loc)
      (at a2 ?loc)
      (not (meeting-done))
      (>= (time) (avail-start a1))
      (>= (time) (avail-start a2))
      (<= (+ (time) (meeting-duration)) (avail-end a1))
      (<= (+ (time) (meeting-duration)) (avail-end a2))
    )
    :effect (and
      (increase (time) (meeting-duration))
      (meeting-done)
    )
  )
)