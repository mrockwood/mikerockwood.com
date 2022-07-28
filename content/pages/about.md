+++
title = "About"
path = "about"
template = "pages/about.html"
+++

<div class="uk-grid-margin uk-container uk-container-expand-right">
    <div class="grid-expand uk-grid-column-large uk-grid" uk-grid>
        <div class="uk-width-3-5@l">
            <div class="uk-margin uk-container-item-padding-remove-right">
                <div class="uk-panel uk-margin-remove-first-child">
                    <img class="" alt data-src="https://dummyimage.com/1200x600" data-sizes="(min-width: 1200px) 1200px" data-width="1200" data-height="600" uk-img>             
                    <div class="el-title uk-h4 uk-margin-top uk-margin-remove-bottom">Mike Rockwood</div>        
                    <div class="el-meta uk-text-meta uk-text-emphasis">Founder</div>        
                </div>
            </div>
        </div>
        <div class="uk-width-2-5@l uk-flex-first@l">
            <div class="uk-panel uk-margin uk-width-xlarge uk-margin-auto-right@s uk-margin-remove-left@s uk-margin-auto uk-text-left">
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est accusam et justo duo dolores.</p>
                <p>consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum, labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                <p class="uk-text-lead">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.</p>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est accusam et justo duo dolores.</p>
                <p>consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum, labore et dolore magna aliquyam erat, sed diam voluptua.</p>
            </div>
        </div>
    </div>
</div>


<section class="uk-section uk-section-large">
    <div class="uk-grid uk-child-width-1-2 uk-child-width-1-4@m uk-grid-collapse" uk-grid>
        <div><img src="https://source.unsplash.com/ieic5Tq8YMk"></div>
        <div><img src="https://source.unsplash.com/pzzHdzlFFXE"></div>
        <div><img src="https://source.unsplash.com/v6aIiHkNTMo"></div>
        <div><img src="https://source.unsplash.com/Ql4Y26OsEoY"></div>
    </div>
</section>


<section class="uk-section">
    <div class="uk-container">
        <div class="uk-margin-large uk-width-xlarge@s uk-text-center">
            <div class="uk-child-width-1-1 uk-child-width-1-3@s uk-grid-large uk-grid-divider uk-grid-match" uk-grid>
                <div>
                    <div class="uk-panel uk-margin-remove-first-child" uk-scrollspy="target: [uk-scrollspy-class];">
                        <h3 class="uk-h6 uk-margin-top uk-margin-remove-bottom">Hardness</h3>        
                        <img class="uk-text-emphasis uk-margin-top" alt uk-svg uk-img="{{ config.base_url | safe }}/images/materials-icon-01.svg">        
                    </div>
                </div>
                <div>
                    <div class="uk-panel uk-margin-remove-first-child" uk-scrollspy="target: [uk-scrollspy-class];">
                        <h3 class="uk-h6 uk-margin-top uk-margin-remove-bottom">Origin</h3>        
                        <img class="uk-text-emphasis uk-margin-top" alt uk-svg uk-img="{{ config.base_url | safe }}/images/materials-icon-02.svg">        
                    </div>
                </div>
                <div>
                    <div class="uk-panel uk-margin-remove-first-child" uk-scrollspy="target: [uk-scrollspy-class];">
                        <h3 class="uk-h6 uk-margin-top uk-margin-remove-bottom">Certificate</h3>        
                        <img class="uk-text-emphasis uk-margin-top" alt uk-svg uk-img="{{ config.base_url | safe }}/images/materials-icon-03.svg">        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
