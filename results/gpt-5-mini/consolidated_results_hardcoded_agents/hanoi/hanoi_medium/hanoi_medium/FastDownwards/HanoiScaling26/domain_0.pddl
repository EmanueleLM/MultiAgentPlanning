(define (domain hanoi)
  :requirements :strips :typing :negative-preconditions
  :types
    disk peg - place
  :predicates
    ;; disk is on a place (either another disk or a peg)
    (on ?d - disk ?p - place)
    ;; a place (disk or peg) has nothing on top of it
    (clear ?p - place)
    ;; static size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  :action orchestrator-move-to-peg
    :parameters (?disk - disk ?from - place ?peg - peg)
    :precondition (and
                    (on ?disk ?from)
                    (clear ?disk)
                    (clear ?peg)
                    ;; prevent no-op moves from a place to the same place
                    (not (= ?from ?peg))
                  )
    :effect (and
              (not (on ?disk ?from))
              (on ?disk ?peg)
              ;; after placing on target, the target is no longer clear
              (not (clear ?peg))
              ;; the former supporting place becomes clear (the disk was removed)
              (clear ?from)
            )
  :action orchestrator-move-to-disk
    :parameters (?disk - disk ?from - place ?target - disk)
    :precondition (and
                    (on ?disk ?from)
                    (clear ?disk)
                    (clear ?target)
                    ;; cannot place larger disk onto smaller disk
                    (smaller ?disk ?target)
                    ;; prevent no-op moves from a place to the same place
                    (not (= ?from ?target))
                  )
    :effect (and
              (not (on ?disk ?from))
              (on ?disk ?target)
              ;; after placing on a disk, that disk is no longer clear
              (not (clear ?target))
              ;; the former supporting place becomes clear
              (clear ?from)
            )
)