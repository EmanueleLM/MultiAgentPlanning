(define (domain hanoi-4-disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; on ?d ?p : disk ?d is directly on place ?p (place = disk or peg)
    (on ?d - disk ?p - (either disk peg))
    ;; clear ?p : no disk is directly on place ?p (place = disk or peg)
    (clear ?p - (either disk peg))
    ;; smaller ?d1 ?d2 : disk d1 is strictly smaller than disk d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; MOVER actions: mover is allowed to perform moves; must move only top disks,
  ;; may move only to an empty place or onto a larger disk.
  (:action mover-move-to-peg
    :parameters (?a - agent ?d - disk ?p - (either disk peg) ?q - peg)
    :precondition (and
                    ;; actor must be the mover object named in the problem
                    (= ?a mover)
                    ;; disk is currently directly on ?p (its support)
                    (on ?d ?p)
                    ;; disk is top (no disk on it)
                    (clear ?d)
                    ;; destination peg must be clear (no disk directly on peg)
                    (clear ?q)
                  )
    :effect (and
              ;; relocate disk
              (not (on ?d ?p))
              (on ?d ?q)
              ;; destination now has a disk on it (not clear)
              (not (clear ?q))
              ;; source place becomes clear (no disk directly on it)
              (clear ?p)
              ;; moved disk remains top (clear)
              (clear ?d)
            )
  )

  (:action mover-move-to-disk
    :parameters (?a - agent ?d - disk ?p - (either disk peg) ?q - disk)
    :precondition (and
                    (= ?a mover)
                    (on ?d ?p)
                    (clear ?d)
                    (clear ?q)             ;; q is top of its stack (no disk on q)
                    (smaller ?d ?q)        ;; size ordering: d must be smaller than q
                  )
    :effect (and
              (not (on ?d ?p))
              (on ?d ?q)
              (not (clear ?q))
              (clear ?p)
              (clear ?d)
            )
  )

  ;; AUDITOR actions: auditor can also perform moves but is modeled as a
  ;; distinct actor. Auditor moves are subject to the same hard constraints.
  (:action auditor-move-to-peg
    :parameters (?a - agent ?d - disk ?p - (either disk peg) ?q - peg)
    :precondition (and
                    (= ?a auditor)
                    (on ?d ?p)
                    (clear ?d)
                    (clear ?q)
                  )
    :effect (and
              (not (on ?d ?p))
              (on ?d ?q)
              (not (clear ?q))
              (clear ?p)
              (clear ?d)
            )
  )

  (:action auditor-move-to-disk
    :parameters (?a - agent ?d - disk ?p - (either disk peg) ?q - disk)
    :precondition (and
                    (= ?a auditor)
                    (on ?d ?p)
                    (clear ?d)
                    (clear ?q)
                    (smaller ?d ?q)
                  )
    :effect (and
              (not (on ?d ?p))
              (on ?d ?q)
              (not (clear ?q))
              (clear ?p)
              (clear ?d)
            )
  )

  ;; Note:
  ;; - There are no actions that allow placing a larger disk on a smaller disk:
  ;;   this is prevented by the (smaller ...) precondition on the -to-disk actions.
  ;; - Moves are only permitted for disks that are top (checked by (clear ?d)).
  ;; - Every move updates (on ...) and (clear ...) facts so the "top disk" invariant
  ;;   is maintained explicitly; there are no derived predicates or post-hoc fixes.
)