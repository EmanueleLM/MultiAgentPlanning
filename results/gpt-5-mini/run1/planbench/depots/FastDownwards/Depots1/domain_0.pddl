(define (domain multiagent_transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types place hoist truck surface cargo step)

  (:predicates
    ; locations
    (at-truck ?tr - truck ?p - place)
    (at-hoist ?h - hoist ?p - place)
    (surface-at ?s - surface ?p - place)

    ; payload relations
    (on-surface ?c - cargo ?s - surface)
    (cargo-on-truck ?c - cargo ?tr - truck)

    ; device / resource state
    (hoist-free ?h - hoist)
    (hoist-inuse ?h - hoist)
    (truck-empty ?tr - truck)
    (truck-loaded ?tr - truck)
    (surface-empty ?s - surface)

    ; security / audit
    (cargo-secured ?c - cargo)
    (audited ?c - cargo)

    ; explicit ordered sequence enforcement
    (step-done ?st - step)
  )

  ; Loader (hoist) actions are prefixed loader_
  (:action loader_load
    :parameters (?h - hoist ?c - cargo ?sfrom - surface ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (surface-at ?sfrom ?p)
      (on-surface ?c ?sfrom)
      (hoist-free ?h)
      (truck-empty ?tr)
      (step-done init)
      (not (cargo-on-truck ?c ?tr))
    )
    :effect (and
      ; remove cargo from its original surface
      (not (on-surface ?c ?sfrom))
      (surface-empty ?sfrom)

      ; place cargo onto the truck
      (cargo-on-truck ?c ?tr)
      (not (truck-empty ?tr))
      (truck-loaded ?tr)

      ; mark hoist as in use while securing happens
      (not (hoist-free ?h))
      (hoist-inuse ?h)

      ; advance sequence
      (step-done loaded)
    )
  )

  (:action loader_secure
    :parameters (?h - hoist ?c - cargo ?tr - truck ?p - place)
    :precondition (and
      (at-hoist ?h ?p)
      (at-truck ?tr ?p)
      (cargo-on-truck ?c ?tr)
      (hoist-inuse ?h)
      (step-done loaded)
      (not (cargo-secured ?c))
    )
    :effect (and
      (cargo-secured ?c)
      ; hoist becomes free again
      (not (hoist-inuse ?h))
      (hoist-free ?h)

      ; advance sequence
      (step-done secured)
    )
  )

  ; Driver (truck) actions are prefixed driver_
  (:action driver_drive
    :parameters (?tr - truck ?from - place ?to - place ?c - cargo)
    :precondition (and
      (at-truck ?tr ?from)
      (step-done secured)
      ; ensure the cargo intended for delivery is secured on this truck
      (cargo-on-truck ?c ?tr)
      (not (= ?from ?to))
      (not (step-done driven))
    )
    :effect (and
      (not (at-truck ?tr ?from))
      (at-truck ?tr ?to)

      ; advance sequence
      (step-done driven)
    )
  )

  (:action driver_unload
    :parameters (?tr - truck ?c - cargo ?sto - surface ?p - place)
    :precondition (and
      (at-truck ?tr ?p)
      (surface-at ?sto ?p)
      (cargo-on-truck ?c ?tr)
      (surface-empty ?sto)
      (step-done driven)
    )
    :effect (and
      ; move cargo from truck to the destination surface
      (not (cargo-on-truck ?c ?tr))
      (on-surface ?c ?sto)
      (not (surface-empty ?sto))

      ; truck becomes empty after unloading
      (truck-empty ?tr)
      (not (truck-loaded ?tr))

      ; advance sequence
      (step-done unloaded)
    )
  )

  ; Auditor actions are prefixed auditor_
  (:action auditor_inspect
    :parameters (?aud - hoist ?c - cargo ?s - surface ?p - place)
    :precondition (and
      (surface-at ?s ?p)
      (on-surface ?c ?s)
      (cargo-secured ?c)
      (step-done unloaded)
      (not (audited ?c))
    )
    :effect (and
      (audited ?c)
      (step-done audited)
    )
  )
)