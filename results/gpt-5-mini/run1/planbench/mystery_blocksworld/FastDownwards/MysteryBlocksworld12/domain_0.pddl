(define (domain orchestrator-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types phase host service)

  (:predicates
    ;; Phases and ordering
    (phase ?p - phase)
    (phase-next ?p1 - phase ?p2 - phase)
    (phase-at ?p - phase)
    (phase-initial ?p - phase)  ; marks the phase where preparation must occur (p1)
    (phase-second ?p - phase)   ; marks the phase for deployment (p2)
    (phase-third ?p - phase)    ; marks the phase for verification (p3)

    ;; Hosts and services state
    (host-available ?h - host)
    (host-prepared ?h - host)
    (service-deployed ?s - service ?h - host)
    (service-verified ?s - service)
  )

  ;; Prepare hosts: only in the initial phase and only if host is available and not yet prepared.
  (:action orchestrator-prepare-host
    :parameters (?p - phase ?h - host)
    :precondition (and
      (phase-at ?p)
      (phase-initial ?p)
      (host-available ?h)
      (not (host-prepared ?h))
    )
    :effect (and
      (host-prepared ?h)
    )
  )

  ;; Deploy service: only in the second phase, requires a prepared host and not already deployed on that host.
  (:action orchestrator-deploy-service
    :parameters (?p - phase ?s - service ?h - host)
    :precondition (and
      (phase-at ?p)
      (phase-second ?p)
      (host-prepared ?h)
      (not (service-deployed ?s ?h))
    )
    :effect (and
      (service-deployed ?s ?h)
    )
  )

  ;; Verify service: only in the third phase, requires the service to be deployed on the given host and not already verified.
  (:action orchestrator-verify-service
    :parameters (?p - phase ?s - service ?h - host)
    :precondition (and
      (phase-at ?p)
      (phase-third ?p)
      (service-deployed ?s ?h)
      (not (service-verified ?s))
    )
    :effect (and
      (service-verified ?s)
    )
  )

  ;; Advance from phase 1 to phase 2: requires that at least one host has been prepared.
  ;; This action moves the phase-at marker forward and cannot be applied backwards.
  (:action orchestrator-advance-p1-to-p2
    :parameters (?p1 - phase ?p2 - phase ?h - host)
    :precondition (and
      (phase-at ?p1)
      (phase-next ?p1 ?p2)
      (host-prepared ?h)   ; requires work of phase 1 completed (host prepared)
    )
    :effect (and
      (not (phase-at ?p1))
      (phase-at ?p2)
    )
  )

  ;; Advance from phase 2 to phase 3: requires that at least one service has been deployed on some host.
  (:action orchestrator-advance-p2-to-p3
    :parameters (?p2 - phase ?p3 - phase ?s - service ?h - host)
    :precondition (and
      (phase-at ?p2)
      (phase-next ?p2 ?p3)
      (service-deployed ?s ?h)  ; requires deployment done in phase 2
    )
    :effect (and
      (not (phase-at ?p2))
      (phase-at ?p3)
    )
  )
)