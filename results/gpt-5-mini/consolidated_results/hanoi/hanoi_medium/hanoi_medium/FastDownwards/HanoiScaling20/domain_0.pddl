(define (domain hanoi_5)
  ;; Tower of Hanoi domain for 5 disks, STRIPS-style with simple typing.
  ;; Modeling choices (minimal, explicit):
  ;; - There are two place subtypes: peg and disk. Both are usable as "places"
  ;;   to support (on ?disk ?place) where ?place can be a peg or another disk.
  ;; - To avoid disjunctions in preconditions we provide two distinct move
  ;;   actions: moving a disk onto an empty peg (move-to-empty) and moving a
  ;;   disk onto another disk (move-onto-disk). This partitions the destination
  ;;   cases cleanly without using OR.
  ;; - The static size ordering is encoded with the predicate (smaller ?d1 ?d2).
  ;; - All natural-language preferences are modeled as hard constraints: illegal
  ;;   placements (larger-on-smaller) are impossible because preconditions
  ;;   require the moving disk to be smaller than the destination disk.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk is directly on place (place = peg or disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top of it
    (clear ?p - place)
    ;; static size relation: first disk strictly smaller than second
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk from any place onto an empty peg.
  ;; Applicable only when the destination peg is clear.
  (:action move-to-empty
    :parameters (?disk - disk ?from - place ?to - peg)
    :precondition (and
                   (on ?disk ?from)
                   (clear ?disk)      ;; disk must be top
                   (clear ?to)        ;; destination peg empty
                   (not (= ?from ?to))
                  )
    :effect (and
             (not (on ?disk ?from))
             (on ?disk ?to)
             ;; destination peg now occupied
             (not (clear ?to))
             ;; the place the disk was on becomes clear
             (clear ?from)
             ;; moved disk is top on its new place (clear true)
             (clear ?disk)
            )
  )

  ;; Move a top disk from any place onto another disk that is currently top.
  ;; Ensures small-on-large by the (smaller ?disk ?to) precondition.
  (:action move-onto-disk
    :parameters (?disk - disk ?from - place ?to - disk)
    :precondition (and
                   (on ?disk ?from)
                   (clear ?disk)      ;; disk must be top
                   (clear ?to)        ;; target disk must be top on its place
                   (smaller ?disk ?to) ;; moving disk is smaller than destination disk
                   (not (= ?from ?to))
                  )
    :effect (and
             (not (on ?disk ?from))
             (on ?disk ?to)
             ;; the target disk is no longer clear
             (not (clear ?to))
             ;; the place the disk was on becomes clear
             (clear ?from)
             ;; moved disk is top on its new place (clear true)
             (clear ?disk)
            )
  )
)