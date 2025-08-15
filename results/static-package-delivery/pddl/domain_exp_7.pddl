(define (domain truckdriver)
  (:requirements :typing)           ; we only need plain typing
  (:types
    truck
    package
    location)

  ; ---------- predicates ----------
  (:predicates
    (truck-at   ?t - truck    ?l - location)          ; where the truck is
    (package-at ?p - package ?l - location)          ; where the package is
    (in         ?p - package ?c - truck)             ; package currently inside truck
    (adjacent   ?l1 - location ?l2 - location) )     ; allowed travel link

  ; ---------- actions ----------
  (:action drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (truck-at ?t ?from)
                    (adjacent ?from ?to))
    :effect (and
              (not (truck-at ?t ?from))
              (truck-at ?t ?to)))

  (:action load-package
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (truck-at ?t ?l)
                    (package-at ?p ?l))
    :effect (and
              (not (package-at ?p ?l))
              (in ?p ?t)))

  (:action unload-package
    :parameters (?t - truck ?p - package ?l - location)
    :precondition (and
                    (truck-at ?t ?l)
                    (in ?p ?t))
    :effect (and
              (not (in ?p ?t))
              (package-at ?p ?l)))
)