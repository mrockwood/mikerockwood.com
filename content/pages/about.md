+++
title = "About"
path = "about"
description = "Hello! I’m Mike. I build digital things. Nice to meet you."
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
                <p>John Smith is a web developer from Salt Lake City, Utah with 14 years of professional experience. He specializes in front-end development and design systems, and has a passion for creating user-friendly and visually appealing websites.</p>
                <p>John began his career as a web developer in 2009, working for a small digital agency in Salt Lake City. During his time there, he gained a wealth of experience in creating and maintaining HTML code, writing and manipulating CSS code, and utilizing JavaScript libraries to create interactive elements. He also developed a strong understanding of web performance optimization, cross-browser compatibility, and responsive design.</p>
                <p class="uk-text-lead">In 2013, John left the agency and began working as a freelancer. During his time as a freelancer, he has worked with a variety of clients, ranging from small startups to large corporations, and has created numerous websites, applications, and design systems. He is well-versed in the latest web technologies, and is always looking for new ways to improve the user experience of his projects.</p>
                <p>John is a highly motivated and experienced web developer, with a strong commitment to creating user-friendly, visually appealing, and performant websites and applications. He is an experienced problem-solver and is always open to new ideas and solutions. He takes great pride in his work, and strives to consistently deliver the highest quality results for his clients.</p>
                <p>John is an active member of his local tech community, attending various meetups and conferences to stay up-to-date on the latest trends and technologies. He is also a mentor to aspiring web developers, helping them to gain the skills and experience they need to succeed in the industry.</p>
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
