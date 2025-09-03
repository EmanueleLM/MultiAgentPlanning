(define (problem block-arrangement-collaborative)
    (:domain block-manipulation-collaborative)
    
    (:objects
        A B C O
    )

    (:init
        (ontable A)
        (ontable B)
        (on C O)
        (on O B)
        (clear A)
        (clear C)
        (clear B)
        (vowel A)
        (vowel O)
        (consonant B)
        (consonant C)
    )
    
    (:goal
        (and
            (ontable A)
            (ontable B)
            (on C O)
            (on O B)
        )
    )
)