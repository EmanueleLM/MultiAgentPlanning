(define (domain multiagent-logistics)
  (:requirements :strips :typing :negative-preconditions)
  (:types truck hoist location container step agent)

  (:predicates
    ;; sequencing
    (current-step ?s - step)

    ;; locations
    (at-truck ?tr - truck ?loc - location)
    (at-hoist ?h - hoist ?loc - location)
    (at-container ?c - container ?loc - location)

    ;; load state
    (truck-empty ?tr - truck)
    (loaded-on ?c - container ?tr - truck)
    (hoist-attached ?h - hoist ?c - container)

    ;; hoist state
    (hoist-idle ?h - hoist)
    (hoist-inspected ?h - hoist)
  )

  ;; ---------------------------
  ;; Truck agent actions (namespaced)
  ;; ---------------------------
  (:action truck_agent-drive-to-site
    :parameters (?tr - truck)
    :precondition (and
      (current-step s1)
      (at-truck ?tr depot)
      (hoist-idle hoist1)           ;; auditor: hoist must be idle while truck is driven to site
    )
    :effect (and
      (not (at-truck ?tr depot))
      (at-truck ?tr site)
      (not (current-step s1))
      (current-step s2)
    )
  )

  (:action truck_agent-drive-to-destination
    :parameters (?tr - truck ?c - container)
    :precondition (and
      (current-step s5)
      (at-truck ?tr site)
      (loaded-on ?c ?tr)            ;; container must be loaded before driving to destination
      (hoist-idle hoist1)           ;; auditor: hoist must be idle during truck travel
    )
    :effect (and
      (not (at-truck ?tr site))
      (at-truck ?tr dest)
      (not (current-step s5))
      (current-step s6)
    )
  )

  ;; ---------------------------
  ;; Hoist agent actions (namespaced)
  ;; Sequence at origin: inspect -> lift -> place-on-truck
  ;; ---------------------------
  (:action hoist_agent-inspect-origin
    :parameters (?h - hoist)
    :precondition (and
      (current-step s2)
      (at-hoist ?h site)
      (hoist-idle ?h)
    )
    :effect (and
      (hoist-inspected ?h)
      (not (current-step s2))
      (current-step s3)
    )
  )

  (:action hoist_agent-lift
    :parameters (?h - hoist ?c - container ?tr - truck)
    :precondition (and
      (current-step s3)
      (hoist-inspected ?h)
      (at-hoist ?h site)
      (at-container ?c site)
      (at-truck ?tr site)
      (truck-empty ?tr)
      (hoist-idle ?h)              ;; hoist must be idle immediately before beginning lift (inspected implies safe to lift)
    )
    :effect (and
      (hoist-attached ?h ?c)
      (not (at-container ?c site)) ;; container removed from ground while attached
      (not (hoist-idle ?h))        ;; hoist becomes busy while attached
      (not (current-step s3))
      (current-step s4)
    )
  )

  (:action hoist_agent-place-on-truck
    :parameters (?h - hoist ?c - container ?tr - truck)
    :precondition (and
      (current-step s4)
      (hoist-attached ?h ?c)
      (at-truck ?tr site)
      (at-hoist ?h site)
      (truck-empty ?tr)
    )
    :effect (and
      (loaded-on ?c ?tr)
      (not (hoist-attached ?h ?c))
      (not (truck-empty ?tr))
      (hoist-idle ?h)             ;; hoist is idle after placing container on truck
      (not (current-step s4))
      (current-step s5)
    )
  )

  ;; ---------------------------
  ;; Hoist moves to destination (must be idle and not attached)
  ;; ---------------------------
  (:action hoist_agent-move-to-destination
    :parameters (?h - hoist)
    :precondition (and
      (current-step s6)
      (at-hoist ?h site)
      (hoist-idle ?h)
      (not (hoist-attached ?h container1)) ;; safety: hoist must not be carrying anything while moving
    )
    :effect (and
      (not (at-hoist ?h site))
      (at-hoist ?h dest)
      (not (current-step s6))
      (current-step s7)
    )
  )

  ;; Inspect at destination before unload
  (:action hoist_agent-inspect-destination
    :parameters (?h - hoist)
    :precondition (and
      (current-step s7)
      (at-hoist ?h dest)
      (hoist-idle ?h)
    )
    :effect (and
      (hoist-inspected ?h)
      (not (current-step s7))
      (current-step s8)
    )
  )

  (:action hoist_agent-unload-to-ground
    :parameters (?h - hoist ?c - container ?tr - truck)
    :precondition (and
      (current-step s8)
      (at-hoist ?h dest)
      (at-truck ?tr dest)
      (loaded-on ?c ?tr)
      (hoist-idle ?h)
      (hoist-inspected ?h)        ;; auditor: inspect before unload
    )
    :effect (and
      (at-container ?c dest)
      (not (loaded-on ?c ?tr))
      (truck-empty ?tr)
      (hoist-idle ?h)
      (not (current-step s8))
      (current-step s9)
    )
  )
)