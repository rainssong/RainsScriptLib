// ==UserScript==
// @name         Fuck微博网页版Update
// @namespace    http://tampermonkey.net/
// @version      0.1
// @description  自动关闭广告，关闭视频自动播放以及微博视频号语音
// @author       parhelion,rainssong
// @include      https://weibo.com/*
// @grant        none
// ==/UserScript==


(function() {
    'use strict';
    const sleep = (timeountMS) => new Promise((resolve) => {
        setTimeout(resolve, timeountMS);
});

    function BanAutoPlay(){
        var e = document.getElementsByClassName("woo-switch-shadow woo-switch-checked")[0];
        if(e){
            e.click();
        }
    }

    function BanSBAudio(){
        var e = document.getElementsByClassName("AfterPatch_bgm_3mYmJ")[0];
        if(e){
        e.parentNode.removeChild(e);
        }
    }

   async function BanAD(){
        var e = document.getElementsByClassName("woo-font woo-font--cross morepop_action_bk3Fq morepop_cross_1Q1PF")[0];
        if(e)
        {
            e.click();
            await sleep(100);
            e = document.getElementsByClassName("woo-box-flex woo-box-alignCenter woo-pop-item-main")[0];
            if(e.textContent=="不感兴趣")
                e.click();
        }
    }


    BanAutoPlay();
    setInterval(BanAutoPlay, 1000);
    setInterval(BanAD, 500);
    setInterval(BanSBAudio, 100);
})();
