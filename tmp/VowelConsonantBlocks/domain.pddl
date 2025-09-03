(define (domain block-manipulation-collaborative)
    (:requirements :strips)
    
    (:predicates 
        (on ?b1 ?b2)
        (ontable ?b)
        (clear ?b)
        (vowel ?b)
        (consonant ?b)
    )
    
    ;; Actions for the Vowel Agent
    (:action move-vowel-to-table
        :parameters (?b ?b2)
        :precondition (and (vowel ?b) (on ?b ?b2) (clear ?b))
        :effect (and (ontable ?b) (clear ?b2) (not (on ?b ?b2)))
    )

    (:action move-vowel-from-table
        :parameters (?b ?b2)
        :precondition (and (vowel ?b) (ontable ?b) (clear ?b) (clear ?b2))
        :effect (and (on ?b ?b2) (not (ontable ?b)) (not (clear ?b2)))
    )

    ;; Actions for the Consonant Agent
    (:action move-consonant-on-consonant
        :parameters (?c ?b)
        :precondition (and (consonant ?c) (consonant ?b) (clear ?c) (clear ?b) (on ?c ?x))
        :effect (and (on ?c ?b) (clear ?x) (not (on ?c ?x)))
    )

    (:action clear-consonant-block
        :parameters (?b)
        :precondition (and (consonant ?b) (on ?x ?b))
        :effect (and (clear ?b) (not (on ?x ?b)) (ontable ?x))
    )
)