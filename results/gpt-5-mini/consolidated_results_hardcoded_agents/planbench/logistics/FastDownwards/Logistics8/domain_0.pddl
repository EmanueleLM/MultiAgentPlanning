(define (domain multiagent-transport)
  (:requirements :strips :typing :negative-preconditions)
  (:types vehicle truck plane location roadloc airport cargo day)

  (:predicates
    ;; location predicates
    (at ?o - (either vehicle cargo) ?l - location)
    (in ?c - cargo ?v - vehicle)

    ;; connectivity (static)
    (connected-road ?from - location ?to - location)
    (connected-air ?from - location ?to - location)

    ;; location classification (static)
    (road-loc ?l - location)
    (airport-loc ?l - location)

    ;; day/time modeling
    (now-day ?d - day)
    (succ ?d1 - day ?d2 - day)
  )

  ;; TRUCK ACTIONS (distinct agent actions)
  (:action truck-drive
    :parameters (?t - truck ?from - location ?to - location ?d - day)
    :precondition (and
      (at ?t ?from)
      (connected-road ?from ?to)
      (now-day ?d)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
    )
  )

  (:action truck-load
    :parameters (?t - truck ?c - cargo ?l - location ?d - day)
    :precondition (and
      (at ?t ?l)
      (at ?c ?l)
      (now-day ?d)
    )
    :effect (and
      (in ?c ?t)
      (not (at ?c ?l))
    )
  )

  (:action truck-unload
    :parameters (?t - truck ?c - cargo ?l - location ?d - day)
    :precondition (and
      (at ?t ?l)
      (in ?c ?t)
      (now-day ?d)
    )
    :effect (and
      (not (in ?c ?t))
      (at ?c ?l)
    )
  )

  ;; PLANE ACTIONS (distinct agent actions)
  (:action plane-fly
    :parameters (?p - plane ?from - location ?to - location ?d - day)
    :precondition (and
      (at ?p ?from)
      (connected-air ?from ?to)
      (now-day ?d)
    )
    :effect (and
      (not (at ?p ?from))
      (at ?p ?to)
    )
  )

  (:action plane-load
    :parameters (?p - plane ?c - cargo ?l - location ?d - day)
    :precondition (and
      (at ?p ?l)
      (at ?c ?l)
      (now-day ?d)
    )
    :effect (and
      (in ?c ?p)
      (not (at ?c ?l))
    )
  )

  (:action plane-unload
    :parameters (?p - plane ?c - cargo ?l - location ?d - day)
    :precondition (and
      (at ?p ?l)
      (in ?c ?p)
      (now-day ?d)
    )
    :effect (and
      (not (in ?c ?p))
      (at ?c ?l)
    )
  )

  ;; DAY PROGRESSION (explicit, enforces contiguous phases)
  (:action advance-day
    :parameters (?d1 - day ?d2 - day)
    :precondition (and
      (now-day ?d1)
      (succ ?d1 ?d2)
    )
    :effect (and
      (not (now-day ?d1))
      (now-day ?d2)
    )
  )
)