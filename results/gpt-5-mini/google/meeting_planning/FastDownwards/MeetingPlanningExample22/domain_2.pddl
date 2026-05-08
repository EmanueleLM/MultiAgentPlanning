(define (domain MeetingPlanningExample22)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent location time)
  (:predicates
    ; Visitor or agent is at a static location (updated by travel action)
    (at ?a - agent ?l - location)
    ; Agent's current timepoint (discrete progression). Exactly one at-time fact per agent should hold.
    (at-time ?a - agent ?t - time)
    ; Successor relation between consecutive discrete timepoints (minute-by-minute)
    (next ?t1 - time ?t2 - time)
    ; Precomputed allowed travel from a location to another between two timepoints (exact duration)
    (can-travel ?from - location ?to - location ?t1 - time ?t2 - time)
    ; Precomputed allowed meeting interval start->end that respects Andrew's continuous availability and minimum duration
    (can-meet ?t1 - time ?t2 - time)
    ; Andrew being physically present at Union Square at a given timepoint
    (andrew-at ?t - time)
    ; Goal indicator that visitor met Andrew for an approved interval
    (met-andrew)
  )

  ; Travel: atomic transition consuming the agent's current timepoint t1 and producing t2,
  ; also updates the agent's location. The travel pairs (t1,t2) are only present in the init
  ; for exactly those (start,end) pairs matching the required travel duration (22 or 24 minutes).
  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?t1 - time ?t2 - time)
    :precondition (and (at ?a ?from) (at-time ?a ?t1) (can-travel ?from ?to ?t1 ?t2))
    :effect (and
              (not (at ?a ?from)) (at ?a ?to)
              (not (at-time ?a ?t1)) (at-time ?a ?t2)
            )
  )

  ; Wait/idle: advance one discrete minute while staying at the same location.
  (:action wait
    :parameters (?a - agent ?t1 - time ?t2 - time)
    :precondition (and (at-time ?a ?t1) (next ?t1 ?t2))
    :effect (and (not (at-time ?a ?t1)) (at-time ?a ?t2))
  )

  ; Meet Andrew: consumes the visitor's timepoint at meeting start and produces the end timepoint,
  ; marks met-andrew. The pair (tstart,tend) must be precomputed in init via can-meet to ensure
  ; Andrew's continuous presence for the whole interval and minimum duration (105 minutes).
  ; Because the meet action consumes tstart and produces tend, the visitor cannot perform travel
  ; or other actions at intermediate times (contiguous occupancy is enforced structurally).
  (:action meet-andrew
    :parameters (?a - agent ?loc - location ?tstart - time ?tend - time)
    :precondition (and
                    (at ?a ?loc)
                    (at-time ?a ?tstart)
                    (can-meet ?tstart ?tend)
                    (andrew-at ?tstart)
                    (andrew-at ?tend)
                  )
    :effect (and
              (not (at-time ?a ?tstart)) (at-time ?a ?tend)
              (met-andrew)
            )
  )
)