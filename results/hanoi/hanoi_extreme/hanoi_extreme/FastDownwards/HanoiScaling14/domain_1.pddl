(define (domain hanoi-7-disks)
    (:requirements :strips :typing :negative-preconditions :action-costs)
    (:types
        disk peg - location
        location - object
    )
    (:predicates
        ; Disk d is directly on top of location loc (peg or disk)
        (on ?d - disk ?loc - location)
        ; Location loc has nothing resting on it
        (clear ?loc - location)
        ; d1 is strictly larger than d2 (Static fact)
        (larger ?d1 - disk ?d2 - disk)
    )
    (:functions
        (total-cost) - number
    )

    (:action move
        :parameters (?d - disk ?from - location ?to - location)
        :precondition (and
            ; 1. Disk D must be resting on FROM location
            (on ?d ?from)
            ; 2. D must be the top disk (nothing on D)
            (clear ?d) 
            ; 3. TO location must be free to receive a disk
            (clear ?to)
            
            ; 4. Size constraint: D cannot be larger than the target disk TO, if TO is a disk.
            ; This checks if TO is a disk (?d_target) and if D is larger than it. If so, the action is blocked.
            (not (exists (?d_target - disk)
                (and 
                    (= ?to ?d_target)
                    (larger ?d ?d_target)
                )
            ))
        )
        :effect (and
            ; Update location of D
            (not (on ?d ?from))
            (on ?d ?to)
            
            ; Update clear status of old location (becomes clear)
            (clear ?from)
            ; Update clear status of new location (becomes occupied)
            (not (clear ?to))
            
            ; Increment move count
            (increase (total-cost) 1)
        )
    )
)