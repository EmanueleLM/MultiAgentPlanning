(define (domain meeting-domain)
  (:requirements :strips :typing :durative-actions :negative-preconditions :fluents :numeric-fluents)
  (:types agent location)

  (:predicates
    (at ?a - agent ?l - location)
  )

  (:functions
    (clock)            ; global clock in minutes since midnight
    (meeting-time)     ; accumulated meeting time (minutes)
    (betty-start)      ; Betty availability start (minutes since midnight)
    (betty-end)        ; Betty availability end (minutes since midnight)
  )

  ;; Traveler: travel from Pacific Heights to Fisherman's Wharf (13 minutes)
  (:durative-action travel-ph-to-fw
    :parameters (?trav - agent)
    :duration (= ?duration 13)
    :condition (and
                 (at start (at ?trav pacific))
                )
    :effect (and
              (at start (not (at ?trav pacific)))
              (at end (at ?trav fishermans))
              (at end (increase (clock) ?duration))
            )
  )

  ;; Traveler: travel from Fisherman's Wharf to Pacific Heights (12 minutes)
  (:durative-action travel-fw-to-ph
    :parameters (?trav - agent)
    :duration (= ?duration 12)
    :condition (and
                 (at start (at ?trav fishermans))
                )
    :effect (and
              (at start (not (at ?trav fishermans)))
              (at end (at ?trav pacific))
              (at end (increase (clock) ?duration))
            )
  )

  ;; Meeting action requiring both agents at Fisherman's Wharf.
  ;; Duration is a variable ?duration constrained to be at least 105 minutes.
  ;; Precondition enforces meeting start no earlier than betty-start and meeting end no later than betty-end.
  (:durative-action meet-at-fishermans
    :parameters (?trav - agent ?bet - agent)
    :duration (>= ?duration 105)
    :condition (and
                 (at start (at ?trav fishermans))
                 (at start (at ?bet fishermans))
                 ; meeting must start no earlier than Betty's availability start
                 (at start (>= (clock) (betty-start)))
                 ; meeting must end no later than Betty's availability end
                 (at start (<= (+ (clock) ?duration) (betty-end)))
                )
    :effect (and
              ; accumulate meeting time by the actual meeting duration
              (at end (increase (meeting-time) ?duration))
              ; advance the global clock by the meeting duration
              (at end (increase (clock) ?duration))
            )
  )

)