(define (domain hanoi)
  ;; Tower of Hanoi domain tailored for Fast-Downward
  ;; Requirements chosen per instruction: only :strips, :typing, :negative-preconditions
  (:requirements :strips :typing :negative-preconditions)

  (:types disk peg)  ; disks and pegs are typed; object (root) is used for mixed arguments

  (:predicates
    ;; on D X   -- disk D is directly on object X (X may be a disk or a peg)
    (on ?d - disk ?x - object)
    ;; clear X  -- nothing on top of object X (X may be a disk or a peg)
    (clear ?x - object)
    ;; allowed D X -- static relation: it is allowed to place disk D onto object X
    ;; (precomputed in the problem from size ordering and pegs)
    (allowed ?d - disk ?x - object)
  )

  ;; Single generic move action. This models moving one top disk from one object to another.
  ;; Preconditions enforce:
  ;;  - the disk is on the source,
  ;;  - the disk is clear (it's the top disk at the source),
  ;;  - the destination is clear (nothing on top of it),
  ;;  - and a precomputed allowed relation holds (prevents larger-on-smaller).
  (:action move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))    ;; destination no longer clear because ?d is placed on it
      (clear ?from)        ;; source becomes clear (top was removed)
    )
  )
)