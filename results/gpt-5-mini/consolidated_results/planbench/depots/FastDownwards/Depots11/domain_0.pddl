; ===============================================================
; Reconciliations and assumptions for FastDownwards compatibility:
; - No structured analyst inputs were available, so I used a canonical
;   "logistics" style domain (trucks, packages, locations) as the
;   public action schemas. This choice is documented and consistent
;   with typical public templates: drive, load, unload.
; - Mapped concepts:
;     "drive"  -> action drive (move truck between locations)
;     "load"   -> action load  (put package into truck)
;     "unload" -> action unload (remove package from truck)
;   These are treated as authoritative action names.
; - To allow a single at predicate for both trucks and packages, I
;   introduced a parent type "obj" and made truck and package subtypes.
;   Predicates are:
;     (at ?o - obj ?l - location)
;     (in ?p - package ?t - truck)
; - All natural-language preferences were treated as hard constraints.
; - Requirements limited to :strips, :typing, and :negative-preconditions
;   (all supported by FastDownwards). No :costs, no :durative-actions,
;   no functions, no equality requirement.
; - No additional availability/inventory was invented beyond the objects
;   and initial facts provided in the problem file below.
; ===============================================================

(define (domain logistics-reconciled)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    obj
    truck package - obj
    location
  )

  (:predicates
    ;; a single at predicate for any object that is a subtype of obj
    (at ?o - obj ?l - location)
    ;; package containment in truck
    (in ?p - package ?t - truck)
  )

  ;; Drive a truck from one location to another.
  ;; Precondition: truck is at source and not already at destination.
  ;; Effect: truck is no longer at source and is at destination.
  (:action drive
    :parameters (?t - truck ?from - location ?to - location)
    :precondition (and
                    (at ?t ?from)
                    (not (at ?t ?to))
                  )
    :effect (and
              (not (at ?t ?from))
              (at ?t ?to)
            )
  )

  ;; Load a package into a truck at the same location.
  ;; Precondition: both package and truck at the same location and
  ;;              package is not already in that truck.
  ;; Effect: package is in truck and no longer at the location.
  (:action load
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
                    (at ?t ?loc)
                    (at ?p ?loc)
                    (not (in ?p ?t))
                  )
    :effect (and
              (in ?p ?t)
              (not (at ?p ?loc))
            )
  )

  ;; Unload a package from a truck to the truck's current location.
  ;; Precondition: package is in the truck and truck is at the target location.
  ;; Effect: package is at the location and no longer in the truck.
  (:action unload
    :parameters (?p - package ?t - truck ?loc - location)
    :precondition (and
                    (in ?p ?t)
                    (at ?t ?loc)
                  )
    :effect (and
              (not (in ?p ?t))
              (at ?p ?loc)
            )
  )
)